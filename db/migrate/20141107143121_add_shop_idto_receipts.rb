class AddShopIdtoReceipts < ActiveRecord::Migration
  def self.up
    add_column :receipts, :shop_id, :integer
  end

  def self.down
    remove column :receipts, :shop_id, :integer
  end
end
