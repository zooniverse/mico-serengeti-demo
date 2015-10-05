class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :subject
      t.string :user_id
      t.string :zooniverse_discussion_id
      t.string :zooniverse_comment_id
      t.text :body

      t.timestamps null: false
    end
  end
end
