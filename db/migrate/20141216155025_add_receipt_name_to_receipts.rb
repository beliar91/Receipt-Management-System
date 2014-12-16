class AddReceiptNameToReceipts < ActiveRecord::Migration
  def self.up
    add_column :receipts, :name, :string
  end

  def self.down
    remove column :receipts, :name, :string
  end
end
