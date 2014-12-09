class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :email
      t.string :telephone

      t.timestamps
    end
  end
end
