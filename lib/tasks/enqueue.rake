namespace :enqueue do
  desc "Enqueue N unsubmitted subjects"
  task :subjects, [:amount] => [:environment] do |t, args|
    limit = args[:amount].to_i

    puts "Enqueueing up to #{limit.inspect} subjects"

    subjects = Subject.where(mico_id: nil).order("random()").limit(limit)

    subjects.each do |subject|
      print '.'
      AnalyseSubjectJob.enqueue(subject.id)
    end

    puts ' done'
  end
end
