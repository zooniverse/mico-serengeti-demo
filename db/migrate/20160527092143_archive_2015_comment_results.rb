class Archive2015CommentResults < ActiveRecord::Migration
  def up
    add_column :comments, "mico_2015_id", :string
    add_column :comments, "mico_2015_status", :string
    add_column :comments, "mico_2015_url", :string
    add_column :comments, "mico_2015_data", :jsonb
    add_column :comments, "mico_2015_submitted_at", :datetime
    add_column :comments, "mico_2015_finished_at", :datetime

    # These were missing compared to subjects table
    add_column :comments, "mico_submitted_at", :datetime
    add_column :comments, "mico_finished_at", :datetime

    ActiveRecord::Base.connection.execute <<-SQL
      UPDATE comments SET
        mico_2015_id = mico_id,
        mico_2015_status = mico_status,
        mico_2015_url = mico_url,
        mico_2015_data = mico_data,
        mico_2015_submitted_at = mico_submitted_at,
        mico_2015_finished_at = mico_finished_at
      WHERE mico_id IS NOT NULL;
    SQL

    ActiveRecord::Base.connection.execute <<-SQL
      UPDATE comments SET
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

    remove_column :comments, "mico_2015_id"
    remove_column :comments, "mico_2015_status"
    remove_column :comments, "mico_2015_url"
    remove_column :comments, "mico_2015_data"
    remove_column :comments, "mico_2015_submitted_at"
    remove_column :comments, "mico_2015_finished_at"

    # These were missing compared to subjects table
    remove_column :comments, "mico_submitted_at"
    remove_column :comments, "mico_finished_at"
  end
end
