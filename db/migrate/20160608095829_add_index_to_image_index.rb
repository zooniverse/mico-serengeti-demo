class AddIndexToImageIndex < ActiveRecord::Migration
  def change
    add_index :subjects, :image_index
  end
end
