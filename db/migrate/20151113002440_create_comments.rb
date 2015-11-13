class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment_body
      t.integer :user_id
      t.string :user_username

      t.timestamps null: false
    end
  end
end
