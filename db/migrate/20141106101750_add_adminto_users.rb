class AddAdmintoUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :admin, :boolean
  end

  def self.down
    remove column :users, :admin, :boolean
  end
end
