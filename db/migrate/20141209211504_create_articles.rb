class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :brand
      t.integer :warranty_time

      t.timestamps
    end
  end
end
