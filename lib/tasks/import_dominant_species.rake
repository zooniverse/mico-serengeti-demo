namespace :import do
  desc "Import dominant species CSV (https://github.com/zooniverse/experiment-analysis/blob/master/blanks/subject_species_all.csv)"
  task :dominant_species, [:filename] => :environment do |t, args|
    puts 'Loading CSV'

    rows = CSV.read(args[:filename], headers: true)
    data = rows.map { |row| [row["subjectID"], row["species"]] }.to_h

    bar = ProgressBar.create total: Subject.count,
                             format: "%t [%e]: %bᗧ%i %c/%C done",
                             progress_mark: ' ',
                             remainder_mark: '･'
    Subject.find_each do |subject|
      bar.increment
      subject.update_attributes(zooniverse_dominant_species: data[subject.zooniverse_id])
    end
  end
end
