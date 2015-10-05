class AddDominantSpecies < ActiveRecord::Migration
  def change
    add_column :subjects, :zooniverse_dominant_species, :string
  end
end
