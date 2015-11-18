namespace :calc do
  desc "Calculate daylight for imported subjects"
  task :daylight do
    puts "Analysing subjects and calculating daylight"
    Subject.find_each do |subject|
      print '.'
      subject.set_light
      subject.save
    end
  end
end
