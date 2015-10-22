class AddDetailedAggregationToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :season, :string
    add_column :subjects, :site_id, :string
    add_column :subjects, :frames, :integer
    add_column :subjects, :time_of_day, :string
    add_column :subjects, :classifications, :integer
    add_column :subjects, :crowd_says, :string
    add_column :subjects, :total_species, :integer
    add_column :subjects, :total_animals, :integer
    add_column :subjects, :crowd_says_if_multi, :string
    add_column :subjects, :retire_reason, :string
    add_column :subjects, :counters_keys, :string
    add_column :subjects, :counters_values, :string
    add_column :subjects, :species_counts_keys, :string
    add_column :subjects, :species_counts_values, :string
    add_column :subjects, :behavior_counters_keys, :string
    add_column :subjects, :behavior_counters_values, :string
    add_column :subjects, :aggregate_species_names, :string
    add_column :subjects, :aggregate_species_counts, :string
  end
end
