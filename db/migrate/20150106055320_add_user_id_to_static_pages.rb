class AddUserIdToStaticPages < ActiveRecord::Migration
  def self.up
    add_column :static_pages, :user_id, :integer
  end

  def self.down
    remove_column :static_pages, :user_id, :integer
  end
end
