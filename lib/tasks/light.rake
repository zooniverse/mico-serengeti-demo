namespace :calc do
  desc "Calculate daylight for imported subjects"
  task :daylight do
    puts "Analysing subjects and calculating daylight"
    subjects = Subject.all()
    subjects.each do |subject|
      print '.'
      subject.set_light()
    end
  end
end
