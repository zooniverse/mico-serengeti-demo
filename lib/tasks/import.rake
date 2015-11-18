namespace :import do
  desc "Import all CSV files"
  task :csv => :environment do
    puts "Creating temporary tables"
    ActiveRecord::Base.connection.execute <<-SQL
      DROP TABLE IF EXISTS csv_subjects;
      CREATE TABLE csv_subjects (
        subject_id varchar(255),
        image_index integer,
        image_url varchar(255),
        subject_group_id varchar(255),
        image_timestamp timestamp
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
      COPY csv_subjects(subject_id,image_index,image_url,subject_group_id,image_timestamp) FROM '#{Rails.root.join("data/subjects.csv")}' DELIMITER ',' CSV HEADER;
      COPY csv_subject_species(id,subject_id,species) FROM '#{Rails.root.join("data/dominant_species.csv")}' DELIMITER ',' CSV HEADER;
      COPY csv_comments(discussion_id,comment_id,subject_id,user_id,body,created_at) FROM '#{Rails.root.join("data/comments.csv")}' DELIMITER ',' CSV HEADER;
    SQL

    puts "Converting and inserting into destination tables"
    ActiveRecord::Base.connection.execute <<-SQL
      INSERT INTO subjects (zooniverse_id, image_index, image_url, subject_group_id, image_timestamp, zooniverse_dominant_species, created_at, updated_at)
      SELECT csv_subjects.subject_id zooniverse_id,
             csv_subjects.image_index,
             csv_subjects.image_url,
             csv_subjects.subject_group_id,
             csv_subjects.image_timestamp,
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

    puts "Removing tables"
    ActiveRecord::Base.connection.execute <<-SQL
      DROP TABLE IF EXISTS csv_subjects;
      DROP TABLE IF EXISTS csv_subject_species;
      DROP TABLE IF EXISTS csv_comments;
    SQL

    puts "Done"
  end

  desc "Import consensus results"
  task :consensus => :environment do
    puts "Importing consensus from csv file"

    ActiveRecord::Base.connection.execute <<-SQL
      DELETE FROM consensus;
      COPY consensus(zooniverse_id,season,site_id,roll_id,frames,time_of_day,classifications,crowd_says,total_species,total_animals,crowd_says_if_multi,retire_reason,counters_keys,counters_values,species_counts_keys,species_counts_values,behavior_counters_keys,behavior_counters_values,aggregate_species_names,aggregate_species_counts) FROM '#{Rails.root.join("data/consensus-detailed.csv")}' DELIMITER ',' CSV HEADER;
    SQL

    puts "Done"
  end

end
