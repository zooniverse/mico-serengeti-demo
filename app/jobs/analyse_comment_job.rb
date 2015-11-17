class AnalyseCommentJob < Que::Job

  def run(comment_id)
    comment = Comment.find(comment_id)

    ActiveRecord::Base.transaction do
      begin
        Timeout.timeout(5.minutes) do
          until comment.finished?
            comment.upsert_mico
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
