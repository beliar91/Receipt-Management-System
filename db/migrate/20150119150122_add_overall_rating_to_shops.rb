class AddOverallRatingToShops < ActiveRecord::Migration
  def change
    add_column :shops, :overall_rating, :float
  end
end
