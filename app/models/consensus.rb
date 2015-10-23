class Consensus < ActiveRecord::Base
  has_many :subjects, primary_key: "zooniverse_id", foreign_key: "zooniverse_id"

  def species_found_by_crowd
    @species_found_by_crowd ||= crowd_says_if_multi.split(";")
  end
end
