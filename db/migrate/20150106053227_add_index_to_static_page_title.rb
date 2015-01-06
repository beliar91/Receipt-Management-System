class AddIndexToStaticPageTitle < ActiveRecord::Migration
  def self.up
    add_index :static_pages, :title
  end

  def self.down
    remove_index :static_pages, :title
  end
end
