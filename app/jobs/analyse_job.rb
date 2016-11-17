class AnalyseJob
  def self.enqueue(subject_id)
    subject = Subject.find(subject_id)

    print "Subject #{subject.id}   "
    AnalyseSubjectJob.enqueue(subject.id)

    subject.comments.each do |comment|
      print "."
      AnalyseCommentJob.enqueue(comment.id)
    end
  end
end
