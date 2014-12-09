class AddLatituteAndLongitudetoShops < ActiveRecord::Migration
  def self.up
    add_column :shops, :latitude, :float
    add_column :shops, :longitude, :float
  end

  def self.down
    remove column :shops, :latitude, :float
    remove column :shops, :longitude, :float
  end
end
