class AddDetailedAggregationToSubjects < ActiveRecord::Migration
  def change
    create_table :consensus do |t|
      t.string  :zooniverse_id
      t.string  :season
      t.string  :site_id
      t.integer :frames
      t.string  :time_of_day
      t.integer :classifications
      t.string  :crowd_says
      t.integer :total_species
      t.integer :total_animals
      t.string  :crowd_says_if_multi
      t.string  :retire_reason
      t.string  :counters_keys
      t.string  :counters_values
      t.string  :species_counts_keys
      t.string  :species_counts_values
      t.string  :behavior_counters_keys
      t.string  :behavior_counters_values
      t.string  :aggregate_species_names
      t.string  :aggregate_species_counts
    end
  end
end
