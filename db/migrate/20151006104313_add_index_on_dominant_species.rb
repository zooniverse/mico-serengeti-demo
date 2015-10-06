class AddIndexOnDominantSpecies < ActiveRecord::Migration
  def change
    add_index :subjects, :zooniverse_dominant_species
  end
end
