namespace :import do
  desc "Import subjects CSV"
  task :subjects, [:filename] => :environment do |t, args|
    rows = CSV.read(args[:filename])
    rows.each do |row|
      Subject.create!(zooniverse_id: row[0], image_index: row[1], image_url: row[2])
    end
  end
end
