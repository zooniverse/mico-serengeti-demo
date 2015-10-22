# -*- coding: utf-8 -*-
require 'ruby-progressbar'

class Report
  attr_reader :subjects, :progress, :results, :detection, :filtering

  def initialize(subjects)
    @subjects = subjects
    @progress = ProgressBar.create \
      output: STDERR,
      total: subjects.count,
      format: "%t [%e]: %bᗧ%i %c/%C done",
      progress_mark: ' ',
      remainder_mark: '･'
    @results = {}
    @detection = Detection.new
    @filtering = Filtering.new
  end

  def calculate
    total = 0

    subjects.find_each do |subject|
      total += 1
      test(:animal_presence, :entire_dataset, subject)
      test(:animal_presence, :daytime, subject)
      test(:animal_presence, :nighttime, subject)
      test(:animal_presence, :blank, subject)
      test(:animal_presence, :blank_or_one_animal, subject)
      test(:animal_presence, :blank_or_simple, subject)
      test(:animal_presence, :blank_or_complex, subject)
      test(:animal_presence, :blank_or_single_species, subject)
      test(:animal_presence, :blank_or_multi_species, subject)
      progress.increment
    end

    puts csv.to_s
  end

  def test(detector, filter, subject)
    result_key = "#{detector}_#{filter}"
    results[result_key] ||= {true_positives: 0, false_positives: 0, true_negatives: 0, false_negatives: 0}

     if filtering.public_send(filter, subject)
      bucket = detection.public_send(detector, subject)
      results[result_key][bucket] += 1
    end
    results
  end

  def csv
    CSV.generate headers: [:what, :sample_size, :true_positives, :true_negatives, :false_positives, :false_negatives, :precision, :recall, :f1], write_headers: true do |csv|
      results.each do |key, counters|
        precision = counters[:true_positives] / (counters[:true_positives] + counters[:false_positives]).to_f
        recall    = counters[:true_positives] / (counters[:true_positives] + counters[:false_negatives]).to_f
        f1        = 2 * (precision * recall) / (precision / recall)

        csv << [
          key,
          counters.values.reduce(&:+),
          counters[:true_positives],
          counters[:true_negatives],
          counters[:false_positives],
          counters[:false_negatives],
          precision,
          recall,
          f1
        ]
      end
    end
  end
end
