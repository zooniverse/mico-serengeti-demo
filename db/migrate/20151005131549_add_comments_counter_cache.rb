class AddCommentsCounterCache < ActiveRecord::Migration
  def change
    add_column :subjects, :comments_count, :integer, null: false, default: 0
  end
end
