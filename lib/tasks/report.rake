namespace :report do
  desc "Print KPI measures based on analysed data"
  task :kpi => :environment do
    subjects = Subject.finished

    counts = {"blank" =>  {"blank" => 0, "animal" => 0},
              "animal" => {"blank" => 0, "animal" => 0}}
    total = 0

    subjects.find_each do |subject|
      total += 1

      expected = (subject.zooniverse_dominant_species == "blank") ? "blank" : "animal"
      analysed = (subject.regions.size == 0) ? "blank" : "animal"

      counts[expected] ||= {}
      counts[expected][analysed] ||= 0
      counts[expected][analysed] += 1

      print '.'
    end

    puts "\n\n\n"
    puts "Results: "
    puts "Counts: #{counts.inspect}"
    puts
    puts "Blank images that Mico thinks are blank:      #{counts["blank"]["blank"]}"
    puts "Blank images that Mico thinks have an animal: #{counts["blank"]["animal"]}"
    puts "Animal shots that Mico thinks are blank:      #{counts["animal"]["blank"]}"
    puts "Animal shots that Mico thinks have animals:   #{counts["animal"]["animal"]}"
    puts "Total:    #{counts.values.map(&:values).flatten.reduce(&:+)}"
    puts "Checksum: #{total}"
  end
end
