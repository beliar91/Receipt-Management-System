class DeleteArticleAndBrandFromReceipts < ActiveRecord::Migration
  def self.up
    remove_column :receipts, :article, :string
    remove_column :receipts, :brand, :string
  end

  def self.down
    add_column :receipts, :article, :string
    add_column :receipts, :brand, :string
  end
end
