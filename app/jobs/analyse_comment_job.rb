class AnalyseCommentJob < Que::Job

  def run(comment_id)
    comment = Comment.find(comment_id)
    comment.update! mico_id: nil, mico_status: 'submitting', mico_submitted_at: Time.now

    ActiveRecord::Base.transaction do
      begin
        Timeout.timeout(5.minutes) do
          until comment.finished?
            comment.upsert_mico
            comment.mico_finished_at = Time.now if comment.finished?
            sleep 1
          end
        end
      rescue Timeout::Error
        comment.mico_status = 'failed'
      ensure
        comment.save
      end
    end
  end
end
