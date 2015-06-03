class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.text :body
      t.integer :user_id, index: true

      t.timestamps null: false
    end
  end
end
