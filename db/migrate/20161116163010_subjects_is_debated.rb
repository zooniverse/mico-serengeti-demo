class SubjectsIsDebated < ActiveRecord::Migration
  def change
    add_column :subjects, :is_debated, :boolean
    add_index :subjects, :is_debated
  end
end
