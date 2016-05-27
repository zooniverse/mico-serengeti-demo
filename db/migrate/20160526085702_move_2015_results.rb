class Move2015Results < ActiveRecord::Migration
  def up
    ActiveRecord::Base.connection.execute <<-SQL
      UPDATE subjects SET
        mico_2015_id = mico_id,
        mico_2015_status = mico_status,
        mico_2015_url = mico_url,
        mico_2015_data = mico_data,
        mico_2015_submitted_at = mico_submitted_at,
        mico_2015_finished_at = mico_finished_at
      WHERE mico_id IS NOT NULL;
    SQL

    ActiveRecord::Base.connection.execute <<-SQL
      UPDATE subjects SET
        mico_id = NULL,
        mico_status = NULL,
        mico_url = NULL,
        mico_data = NULL,
        mico_submitted_at = NULL,
        mico_finished_at = NULL
      WHERE mico_id IS NOT NULL;
    SQL
  end

  def down
    ActiveRecord::Base.connection.execute <<-SQL
      UPDATE subjects SET
        mico_id = mico_2015_id,
        mico_status = mico_2015_status,
        mico_url = mico_2015_url,
        mico_data = mico_2015_data,
        mico_submitted_at = mico_2015_submitted_at,
        mico_finished_at = mico_2015_finished_at
      WHERE mico_2015_id IS NOT NULL;
    SQL

    ActiveRecord::Base.connection.execute <<-SQL
      UPDATE subjects SET
        mico_2015_id = NULL,
        mico_2015_status = NULL,
        mico_2015_url = NULL,
        mico_2015_data = NULL,
        mico_2015_submitted_at = NULL,
        mico_2015_finished_at = NULL
      WHERE mico_2015_id IS NOT NULL;
    SQL

  end
end
