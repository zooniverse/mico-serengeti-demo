class AddMicoUrlToComments < ActiveRecord::Migration
  def change
    add_column :comments, :mico_url, :string
  end
end
