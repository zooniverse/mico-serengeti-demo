require 'time'

namespace :report do
  desc "Print KPI measures based on analysed data"
  task :kpi => :environment do
    subjects = Subject.finished.where("(mico_data->'processingEnd') != 'null'").includes(:consensus)
    report = Report.new(subjects)
    report.calculate
  end

  desc "Print performance measures"
  task :performance => :environment do
    csv = CSV.new($stdout, headers: %w(subject_id zoo_id updated_at processing_start processing_finish process_time), write_headers: true)

    Subject.finished.order(updated_at: :asc).find_each do |subject|
      a = subject.mico_data["processingBegin"]
      b = subject.mico_data["processingEnd"]
      if a && b
        csv << [subject.id, subject.zooniverse_id, subject.updated_at, a, b, Time.parse(b) - Time.parse(a)]
      else
        csv << [subject.id, subject.zooniverse_id, subject.updated_at, a, b, nil]

      end
    end
  end
end
