namespace :report do
  def print_kpi(results)
    precision = results[:true_positives] / (results[:true_positives] + results[:false_positives]).to_f
    recall    = results[:true_positives] / (results[:true_positives] + results[:false_negatives]).to_f
    f1        = 2 * (precision * recall) / (precision / recall)

    puts "Precision (animal detection): #{precision}"
    puts "Recall    (animal detection): #{recall}"
    puts "F1-measure:                   #{f1}"
  end

  desc "Print KPI measures based on analysed data"
  task :kpi => :environment do
    subjects = Subject.finished

    results = {true_positives: 0, false_positives: 0, true_negatives: 0, false_negatives: 0}
    total = 0

    subjects.find_each do |subject|
      total += 1

      if subject.zooniverse_dominant_species != "blank"
        if subject.regions.size > 0
          results[:true_positives] += 1
        else
          results[:false_negatives] += 1
        end
      else
        if subject.regions.size > 0
          results[:false_positives] += 1
        else
          results[:true_negatives] += 1
        end
      end

      print '.'
    end

    puts "\n\n\n"
    puts "Results: "
    puts "Blank images that Mico thinks are blank:      #{results[:true_negatives]}"
    puts "Blank images that Mico thinks have an animal: #{results[:false_positives]}"
    puts "Animal shots that Mico thinks are blank:      #{results[:false_negatives]}"
    puts "Animal shots that Mico thinks have animals:   #{results[:true_positives]}"
    puts
    print_kpi(results)
    puts
    puts "Total:    #{results.values.reduce(&:+)}"
    puts "Checksum: #{total}"
  end
end
