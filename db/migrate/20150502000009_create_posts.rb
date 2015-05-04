class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.text :description
      t.boolean :cat_news
      t.boolean :cat_programming
      t.boolean :cat_education
      t.boolean :cat_sports
      t.boolean :cat_humor
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
