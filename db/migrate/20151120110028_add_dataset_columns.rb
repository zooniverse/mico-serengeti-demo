class AddDatasetColumns < ActiveRecord::Migration
  def change
    add_column :subjects, :vr1_entire_dataset, :boolean
    add_column :subjects, :vr1_daytime, :boolean
    add_column :subjects, :vr1_nighttime, :boolean
    add_column :subjects, :vr1_blank, :boolean
    add_column :subjects, :vr1_non_blank, :boolean
    add_column :subjects, :vr1_one_animal, :boolean
    add_column :subjects, :vr1_simple, :boolean
    add_column :subjects, :vr1_complex, :boolean

    add_column :subjects, :vr1_single_species, :boolean
    add_column :subjects, :vr1_only_buffalo, :boolean
    add_column :subjects, :vr1_only_elephant, :boolean
    add_column :subjects, :vr1_only_ostrich, :boolean
    add_column :subjects, :vr1_only_warthog, :boolean
    add_column :subjects, :vr1_only_wildebeest, :boolean
    add_column :subjects, :vr1_only_other, :boolean

    add_column :subjects, :vr1_multi_species, :boolean
    add_column :subjects, :vr1_multi_including_buffalo, :boolean
    add_column :subjects, :vr1_multi_including_elephant, :boolean
    add_column :subjects, :vr1_multi_including_ostrich, :boolean
    add_column :subjects, :vr1_multi_including_warthog, :boolean
    add_column :subjects, :vr1_multi_including_wildebeest, :boolean
    add_column :subjects, :vr1_multi_including_none_of_the_five, :boolean
  end
end
