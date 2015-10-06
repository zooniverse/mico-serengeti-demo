namespace :import do
  desc "Import all CSV files"
  task :csv => :environment do
    puts "Creating temporary tables"
    ActiveRecord::Base.connection.execute <<-SQL
      DROP TABLE IF EXISTS csv_subjects;
      CREATE TABLE csv_subjects (
        subject_id varchar(255),
        image_index integer,
        image_url varchar(255)
      );

      DROP TABLE IF EXISTS csv_subject_species;
      CREATE TABLE csv_subject_species (
        id varchar(255),
        subject_id varchar(255),
        species varchar(255)
      );

      DROP TABLE IF EXISTS csv_comments;
      CREATE TABLE csv_comments (
        discussion_id varchar(255),
        comment_id varchar(255),
        subject_id varchar(255),
        user_id varchar(255),
        body text,
        created_at timestamp
      );
    SQL

    puts "Importing CSV files"
    ActiveRecord::Base.connection.execute <<-SQL
      COPY csv_subjects(subject_id,image_index,image_url) FROM '#{Rails.root.join("data/subjects.csv")}' DELIMITER ',' CSV;
      COPY csv_subject_species(id,subject_id,species) FROM '#{Rails.root.join("data/dominant_species.csv")}' DELIMITER ',' CSV HEADER;
      COPY csv_comments(discussion_id,comment_id,subject_id,user_id,body,created_at) FROM '#{Rails.root.join("data/comments.csv")}' DELIMITER ',' CSV HEADER;
    SQL

    puts "Converting and inserting into destination tables"
    ActiveRecord::Base.connection.execute <<-SQL
      INSERT INTO subjects (zooniverse_id, image_index, image_url, zooniverse_dominant_species, created_at, updated_at)
      SELECT csv_subjects.subject_id zooniverse_id,
             csv_subjects.image_index,
             csv_subjects.image_url,
             csv_subject_species.species zooniverse_dominant_species,
             NOW(),
             NOW()
      FROM csv_subjects
      INNER JOIN csv_subject_species ON csv_subjects.subject_id = csv_subject_species.subject_id;

      INSERT INTO comments (zooniverse_discussion_id, zooniverse_comment_id, zooniverse_user_id, body, created_at, updated_at, subject_id)
      SELECT csv_comments.discussion_id zooniverse_discussion_id,
             csv_comments.comment_id zooniverse_comment_id,
             csv_comments.user_id zooniverse_user_id,
             csv_comments.body,
             csv_comments.created_at,
             csv_comments.created_at,
             subjects.id subject_id
      FROM csv_comments
      INNER JOIN subjects ON csv_comments.subject_id = subjects.zooniverse_id;
    SQL

    puts "Rebuilding counter caches"
    ActiveRecord::Base.connection.execute <<-SQL
      UPDATE subjects
      SET comments_count = subquery.comments_count
      FROM (
        SELECT subjects.id, COUNT(*) AS comments_count FROM subjects
        INNER JOIN comments on comments.subject_id = subjects.id
        GROUP BY subjects.id
      ) AS subquery
      WHERE subjects.id = subquery.id;
    SQL
  end

  desc "Import subjects CSV"
  task :subjects, [:filename] => :environment do |t, args|
    bar = ProgressBar.create total: `wc -l #{args[:filename]}`.to_i,
                             format: "%t [%e]: %bᗧ%i %c/%C done",
                             progress_mark: ' ',
                             remainder_mark: '･'

    CSV.foreach(args[:filename]) do |row|
      bar.increment
      Subject.find_or_create_by!(zooniverse_id: row[0], image_index: row[1], image_url: row[2])
    end
  end
end
