class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string  :zooniverse_id
      t.integer :image_index
      t.string  :image_url

      t.string  :mico_id
      t.string  :mico_status
      t.string  :mico_url
      t.jsonb   :mico_data
    end

    add_index :subjects, :mico_id, unique: true
    add_index :subjects, :mico_status
  end
end
