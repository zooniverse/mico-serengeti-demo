namespace :enqueue do
  desc "Enqueue N unsubmitted stuff"
  task :stuff, [:amount] => [:environment] do |t, args|
    limit = args[:amount].to_i

    puts "Enqueueing up to #{limit.inspect} stuff"

    subjects = Subject.where(mico_id: nil).where("mico_2015_id IS NOT NULL").order("random()").limit(limit)
    comments = Comment.where(mico_id: nil).order("random()").limit(limit)

    (subjects + comments).shuffle.first(limit).each do |thing|
      print '.'
      case thing
      when Subject
        AnalyseSubjectJob.enqueue(thing.id)
      when Comment
        AnalyseCommentJob.enqueue(thing.id)
      else
        raise 'wtf'
      end
    end

    puts ' done'
  end

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

  desc "Enqueue N unsubmitted comments"
  task :subjects, [:amount] => [:environment] do |t, args|
    limit = args[:amount].to_i

    puts "Enqueueing up to #{limit.inspect} comments"

    comments = Comment.where(mico_id: nil).order("random()").limit(limit)
    comments.each do |comment|
      print '.'
      AnalyseCommentJob.enqueue(comment.id)
    end

    puts ' done'
  end
end
