class AddLightToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :light, :string
  end
end
