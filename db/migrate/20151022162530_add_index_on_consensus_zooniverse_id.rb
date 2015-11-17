class AddIndexOnConsensusZooniverseId < ActiveRecord::Migration
  def change
    add_index :consensus, :zooniverse_id
  end
end
