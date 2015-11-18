class AddRollIdToConsensus < ActiveRecord::Migration
  def change
    add_column :consensus, :roll_id, :string
  end
end
