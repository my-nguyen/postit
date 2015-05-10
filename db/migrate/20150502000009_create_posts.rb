class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.text :description
      t.boolean :news
      t.boolean :programming
      t.boolean :education
      t.boolean :sports
      t.boolean :humor
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
