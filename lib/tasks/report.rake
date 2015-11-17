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
    csv = CSV.new($stdout, headers: %w(key value), write_headers: true)

    latency = []
    throughput = []

    last_finished_at = nil
    Subject.finished.where.not(mico_submitted_at: nil, mico_finished_at: nil).order(:mico_finished_at).each do |subject|
      latency << subject.mico_finished_at - subject.mico_submitted_at

      if last_finished_at
        diff = subject.mico_finished_at - last_finished_at
        throughput << diff if diff < 120 # if there's a larger gap, it wasn't a batch being processed, so skip the gap
      end

      last_finished_at = subject.mico_finished_at
    end

    latency.descriptive_statistics.each do |k, v|
      csv << ["latency #{k}", v]
    end

    throughput.descriptive_statistics.each do |k, v|
      csv << ["throughput #{k}", v]
    end
  end
end
