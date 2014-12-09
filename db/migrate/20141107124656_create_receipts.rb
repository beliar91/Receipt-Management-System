class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.date :shopping_date
      t.string :article
      t.string :brand
      t.string :shop

      t.timestamps
    end
  end
end
