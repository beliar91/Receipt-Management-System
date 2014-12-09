class AddUserIdToShop < ActiveRecord::Migration
  def self.up
    add_column :shops, :user_id, :integer
  end

  def self.down
    remove column :shops, :user_id, :integer
  end
end
