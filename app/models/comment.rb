class Comment < ActiveRecord::Base
  belongs_to :subject, counter_cache: true

  def finished?
    mico_status == "finished"
  end

  def status
    (mico_status || "unprocessed").underscore
  end

  def mico_data
    super || {}
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
    detection = Mico::Api::Client::TextAnalysis.submit(body)
    set_mico_attributes(detection)
  end

  def update_from_mico
    detection = Mico::Api::Client::TextAnalysis.new(mico_id).reload
    set_mico_attributes(detection)
  end

  def set_mico_attributes(detection)
    self.mico_id = detection.id
    self.mico_data = detection.attributes
    self.mico_url = detection.mico_url
    self.mico_status = mico_data.fetch("status")
    self
  end

  def topics
    mico_data["topics"] || []
  end

  def entities
    mico_data["entities"] || []
  end

  def entity_labels
    entities.map { |e| e['label'] }
  end
end
