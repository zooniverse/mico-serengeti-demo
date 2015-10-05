class Subject < ActiveRecord::Base

  scope :unsubmitted, -> { where(mico_status: nil) }
  scope :to_update,   -> { where("mico_status IS NOT NULL AND mico_status != 'finished'") }
  scope :finished,    -> { where(mico_status: "finished") }

  def submit_to_mico
    self.mico_id = SecureRandom.uuid
    self.mico_data = mico.submit(mico_id, image_url)
    self.mico_status = mico_data.fetch("status")
    self.mico_url = mico_data.fetch("contentItem")
    self
  end

  def update_mico_data
    self.mico_data = mico.check(mico_id)
    self.mico_status = mico_data.fetch("status")
    self.mico_url = mico_data.fetch("contentItem")
    self
  end

  def mico
    @mico ||= Mico::Api::Client.new
  end
end
