class AddReceiptIdToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :receipt_id, :integer
  end

  def self.down
    remove column :articles, :receipt_id, :integer
  end
end
