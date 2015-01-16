class DeleteRatyRater < ActiveRecord::Migration
  def change

    drop_table :average_caches
    drop_table :overall_averages
    drop_table :rates
    drop_table :rating_caches

  end
end
