class CreateShopSearches < ActiveRecord::Migration
  def change
    create_table :shop_searches do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
