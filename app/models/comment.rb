class Comment < ActiveRecord::Base
  belongs_to :subject, counter_cache: true
end
