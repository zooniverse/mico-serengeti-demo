class Store2015Results < ActiveRecord::Migration
  def change
    add_column :subjects, "mico_2015_id", :string
    add_column :subjects, "mico_2015_status", :string
    add_column :subjects, "mico_2015_url", :string
    add_column :subjects, "mico_2015_data", :jsonb
    add_column :subjects, "mico_2015_submitted_at", :datetime
    add_column :subjects, "mico_2015_finished_at", :datetime
  end
end
