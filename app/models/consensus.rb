class Consensus < ActiveRecord::Base
  has_many :subjects, primary_key: "zooniverse_id", foreign_key: "zooniverse_id"
end
