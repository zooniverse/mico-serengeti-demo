class AddSubmitFinishTimestamps < ActiveRecord::Migration
  def change
    add_column :subjects, :mico_submitted_at, :timestamp
    add_column :subjects, :mico_finished_at,  :timestamp
  end
end
