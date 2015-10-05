namespace :import do
  desc "Import subjects CSV"
  task :comments, [:filename] => :environment do |t, args|
    rows = CSV.read(args[:filename], headers: true)
    rows.each do |row|
      subject = Subject.find_by(zooniverse_id: row["subject_id"])

      if subject
        print '.'
        Comment.create! subject_id: subject.id,
                        zooniverse_discussion_id: row["discussion_id"],
                        zooniverse_comment_id: row["comment_id"],
                        zooniverse_user_id: row["user_id"],
                        body: row["body"],
                        created_at: row["timestamp"]
      end
    end
  end
end
