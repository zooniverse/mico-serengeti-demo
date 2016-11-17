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

  task :reload_recommendations => :environment do
    Subject.where("updated_at > ?", Time.local(2016, 11, 11)).find_each do |subject|
      subject.mico_recommendation = subject.get_recommendation
      subject.is_debated = subject.mico_recommendation["is_debated"]
      subject.save!
    end
  end

  task :get_new_recommendations => :environment do
    Subject.where("is_debated IS NULL AND updated_at > ?", Time.local(2016, 11, 11)).find_each do |subject|
      subject.mico_recommendation = subject.get_recommendation
      subject.is_debated = subject.mico_recommendation["is_debated"]
      subject.save!
    end
  end

  task :recommendations => :environment do
    Subject.where.not(mico_recommendation: nil).find_each do |subject|
      color  = subject.mico_recommendation["is_debated"] ? :yellow : :white
      result = subject.mico_recommendation.inspect.colorize(color)
      print subject.id
      print " - "
      puts result

      puts "Animals: #{subject.detected_animals}"
      subject.comments.each do |comment|
        puts "Entities: #{comment.entity_labels}" unless comment.entities.empty?
      end

      puts "\n\n"
    end
  end
end
