namespace :import do
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
