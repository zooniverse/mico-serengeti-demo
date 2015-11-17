class AddSubjectGroupAndImageTimestamp < ActiveRecord::Migration
  def change
    add_column :subjects, :subject_group_id, :string, null: false
    add_column :subjects, :image_timestamp, :timestamp
  end
end
