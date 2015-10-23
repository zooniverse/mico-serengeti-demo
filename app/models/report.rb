# -*- coding: utf-8 -*-
require 'ruby-progressbar'

class Report
  SPECIES = ["steenbok",
    "rodents",
    "genet",
    "gazellegrants",
    "warthog",
    "aardwolf",
    "blank",
    "ostrich",
    "lionfemale",
    "multi",
    "elephant",
    "aardvark",
    "eland",
    "mongoose",
    "topi",
    "honeybadger",
    "gazellethomsons",
    "cheetah",
    "wildcat",
    "rhinoceros",
    "civet",
    "lionmale",
    "reptiles",
    "porcupine",
    "zorilla",
    "serval",
    "caracal",
    "waterbuck",
    "dikdik",
    "secretarybird",
    "hyenastriped",
    "buffalo",
    "duiker",
    "wildebeest",
    "batearedfox",
    "hippopotamus",
    "bushbuck",
    "zebra",
    "guineafowl",
    "koribustard",
    "cattle",
    "hyenaspotted",
    "impala",
    "otherbird",
    "leopard",
    "hartebeest",
    "jackal",
    "reedbuck",
    "hare",
    "human",
    "insectspider",
    "giraffe",
    "baboon",
    "bat",
    "vervetmonkey",
    "vulture"
  ].sort

  attr_reader :subjects, :progress, :results

  def initialize(subjects)
    @subjects = subjects
    @progress = ProgressBar.create \
      output: STDERR,
      total: subjects.count,
      format: "%t [%e]: %bᗧ%i %c/%C done",
      progress_mark: ' ',
      remainder_mark: '･'
    @results = {}
  end

  def calculate
    detectors = [Detection::AnimalPresence.new]
    detectors += (0..10).map { |i| Detection::AnimalCount.new(i) }
    detectors += SPECIES.map { |i| Detection::AnimalType.new(i) }

    filters = []
    filters << Filtering::SimpleFilter.new(:entire_dataset)
    filters << Filtering::SimpleFilter.new(:daytime)
    filters << Filtering::SimpleFilter.new(:nighttime)
    filters << Filtering::SimpleFilter.new(:blank)
    filters << Filtering::SimpleFilter.new(:one_animal)
    filters << Filtering::SimpleFilter.new(:simple)
    filters << Filtering::SimpleFilter.new(:complex)
    filters << Filtering::SimpleFilter.new(:single_species)
    filters << Filtering::SimpleFilter.new(:multi_species)
    filters += SPECIES.map { |i| Filtering::SpecificSpecies.new(i) }

    subjects.find_each do |subject|
      detectors.each do |detector|
        filters.each do |filter|
          test(detector, filter, subject)
        end
      end

      progress.increment
    end

    puts csv.to_s
  end

  def test(detector, filter, subject)
    results[detector.name] ||= {}
    results[detector.name][filter.name] ||= {true_positives: 0, false_positives: 0, true_negatives: 0, false_negatives: 0}

    if filter.check(subject)
      bucket = detector.check(subject)
      results[detector.name][filter.name][bucket] += 1
    end
  end

  def csv
    CSV.generate headers: [:detector, :filter, :sample_size, :true_positives, :true_negatives, :false_positives, :false_negatives, :precision, :recall, :f1], write_headers: true do |csv|
      results.each do |detector_key, filters|
        filters.each do |filter_key, counters|
          precision = counters[:true_positives] / (counters[:true_positives] + counters[:false_positives]).to_f
          recall    = counters[:true_positives] / (counters[:true_positives] + counters[:false_negatives]).to_f
          f1        = 2 * (precision * recall) / (precision + recall)

          csv << [
            detector_key,
            filter_key,
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
end
