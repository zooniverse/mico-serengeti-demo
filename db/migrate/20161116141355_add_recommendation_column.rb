class AddRecommendationColumn < ActiveRecord::Migration
  def change
    add_column :subjects, :mico_recommendation, :jsonb
  end
end
