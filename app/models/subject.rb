class Subject < ActiveRecord::Base
  has_many :comments

  scope :unsubmitted, -> { where(mico_status: nil) }
  scope :to_update,   -> { where("mico_status IS NOT NULL AND mico_status != 'finished'") }
  scope :finished,    -> { where(mico_status: "finished") }

  def finished?
    mico_status == "finished"
  end

  def status
    (mico_status || "unprocessed").underscore
  end

  def regions
    return [] unless finished?
    mico_data.fetch("contentParts") { [] }.map.with_index { |part, idx| Region.new(idx, part) }
  end

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
