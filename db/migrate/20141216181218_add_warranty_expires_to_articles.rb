class AddWarrantyExpiresToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :warranty_expires, :date
  end

  def self.down
    remove column :articles, :warranty_expires, :date
  end
end
