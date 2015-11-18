class Subject < ActiveRecord::Base
  belongs_to :consensus, primary_key: "zooniverse_id", foreign_key: "zooniverse_id"
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

    if mico_data.fetch("status") == "finished"
      if mico_data.fetch("processingEnd").present?
        self.mico_status = "finished"
      else
        self.mico_status = "failed"
      end
    else
      self.mico_status = mico_data.fetch("status")
    end

    self
  end

  def fixed_time
    if self.consensus.site_id=="G04" and self.consensus.roll_id=="R3"
      self.image_timestamp += 60.minutes
    end
    self.image_timestamp.in_time_zone("Africa/Nairobi")
  end

  def fixed_time_human_readable
    self.fixed_time.strftime "%Y-%m-%d %H:%M"
  end

  def light
    just_the_time = Time.parse(self.fixed_time.strftime "%H:%M")

    # using average dawn, dusk, sunrise, sunset times from http://www.gaisma.com/en/location/dar-es-salaam.html ,
    # with a 2 hour tolerance, generate time of day as "day", "night", or "twilight"
    sunset_min = Time.parse("18:13")
    sunset_max = Time.parse("18:47")
    sunrise_min = Time.parse("05:55")
    sunrise_max = Time.parse("06:27")
    dawn_min = Time.parse("05:33")
    dawn_max = Time.parse("06:08")
    dusk_min = Time.parse("18:35")
    dusk_max = Time.parse("19:09")
    average_sunset = Time.at([sunset_min,sunset_max].map(&:to_i).reduce(:+) / 2)
    average_sunrise = Time.at([sunrise_min,sunrise_max].map(&:to_i).reduce(:+) / 2)
    average_dusk = Time.at([dusk_min,dusk_max].map(&:to_i).reduce(:+) / 2)
    average_dawn = Time.at([dawn_min,dawn_max].map(&:to_i).reduce(:+) / 2)
    # whatever the length of the twilight period, treat half its length before and after as counting as twilight.
    twilight_tolerance_morning = average_sunrise - average_dawn
    twilight_tolerance_evening = average_dusk - average_sunset
    beginning_of_morning_twilight = average_dawn - twilight_tolerance_morning
    end_of_morning_twilight = average_sunrise + twilight_tolerance_morning
    beginning_of_evening_twilight = average_sunset - twilight_tolerance_evening
    end_of_evening_twilight = average_dusk + twilight_tolerance_evening
    end_of_day = Time.parse("11:59:59")
    start_of_day = Time.parse("00:00:00")

    case just_the_time.to_i
    when (start_of_day.to_i..beginning_of_morning_twilight.to_i)
      "night"
    when (beginning_of_morning_twilight.to_i..end_of_morning_twilight.to_i)
      "twilight"
    when (end_of_morning_twilight.to_i..beginning_of_evening_twilight.to_i)
      "day"
    when (beginning_of_evening_twilight.to_i..end_of_evening_twilight.to_i)
      "twilight"
    when (end_of_evening_twilight.to_i..end_of_day.to_i)
      "night"
    else
      "night"
    end
  end

  def set_light
    self.light = light()
    self
  end

end
