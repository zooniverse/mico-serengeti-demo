class AddMicoColsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :mico_id, :string
    add_column :comments, :mico_status, :string
    add_column :comments, :mico_data, :jsonb
  end
end
