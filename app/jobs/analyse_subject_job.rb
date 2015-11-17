class AnalyseSubjectJob < Que::Job

  def run(subject_id)
    subject = Subject.find(subject_id)
    subject.update! mico_id: nil, mico_status: 'submitting', mico_submitted_at: Time.now

    ActiveRecord::Base.transaction do
      begin
        Timeout.timeout(5.minutes) do
          until subject.mico_status == 'finished' || subject.mico_status == "failed"
            subject.upsert_mico
            subject.mico_finished_at = Time.now if subject.finished?
            subject.save
            sleep 1
          end
        end
      rescue Timeout::Error
        subject.mico_status = 'failed'
      ensure
        subject.save
      end
    end
  end
end
