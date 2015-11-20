class AddDatasetColumns < ActiveRecord::Migration
  def change
    add_column :subjects, :entire_dataset, :boolean
    add_column :subjects, :daytime, :boolean
    add_column :subjects, :nighttime, :boolean
    add_column :subjects, :blank, :boolean
    add_column :subjects, :non_blank, :boolean
    add_column :subjects, :one_animal, :boolean
    add_column :subjects, :simple, :boolean
    add_column :subjects, :complex, :boolean

    add_column :subjects, :single_species, :boolean
    add_column :subjects, :only_buffalo, :boolean
    add_column :subjects, :only_elephant, :boolean
    add_column :subjects, :only_ostrich, :boolean
    add_column :subjects, :only_warthog, :boolean
    add_column :subjects, :only_wildebeest, :boolean
    add_column :subjects, :only_other, :boolean

    add_column :subjects, :multi_species, :boolean
    add_column :subjects, :multi_including_buffalo, :boolean
    add_column :subjects, :multi_including_elephant, :boolean
    add_column :subjects, :multi_including_ostrich, :boolean
    add_column :subjects, :multi_including_warthog, :boolean
    add_column :subjects, :multi_including_wildebeest, :boolean
    add_column :subjects, :multi_including_none_of_the_five, :boolean
  end
end
