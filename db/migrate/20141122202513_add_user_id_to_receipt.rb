class AddUserIdToReceipt < ActiveRecord::Migration
  def self.up
    add_column :receipts, :user_id, :integer
  end

  def self.down
    remove column :receipts, :user_id, :integer
  end
end
