class AnalyseSubjectJob < Que::Job

  def run(subject_id)
    subject = Subject.find(subject_id)

    ActiveRecord::Base.transaction do
      begin
        Timeout.timeout(5.minutes) do
          until subject.finished?
            subject.upsert_mico
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
