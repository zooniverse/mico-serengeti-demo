class Subject < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  scope :unsubmitted, -> { where(mico_status: nil) }
  scope :to_update,   -> { where("mico_status IS NOT NULL AND mico_status != 'finished'") }
  scope :finished,    -> { where(mico_status: "finished") }

  def finished?
    mico_status == "finished"
  end

  def status
    (mico_status || "unprocessed").underscore
  end

  def mico_data
    super || {}
  end

  def regions
    mico_data.fetch("objects") { [] }.map.with_index { |part, idx| Region.new(idx, part) }
  end

  def thumb_url
    image_url.gsub("standard", "thumbnail")
  end

  def upsert_mico
    return if finished?

    if mico_id
      update_from_mico
    else
      submit_to_mico
    end
  end

  def submit_to_mico
    detection = Mico::Api::Client::AnimalDetection.submit(image_url)
    set_mico_attributes(detection)
  end

  def update_from_mico
    detection = Mico::Api::Client::AnimalDetection.new(mico_id).reload
    set_mico_attributes(detection)
  end


  def set_mico_attributes(detection)
    self.mico_id = detection.id
    self.mico_data = detection.attributes
    self.mico_status = mico_data.fetch("status")
    self
  end
end
