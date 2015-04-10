class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :price
      t.string :description
      t.string :title
      t.string :image_url
      t.string :email
      t.integer :category_id

    end
  end
end
