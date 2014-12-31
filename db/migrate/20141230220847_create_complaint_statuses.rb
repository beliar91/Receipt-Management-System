class CreateComplaintStatuses < ActiveRecord::Migration
  def change
    create_table :complaint_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
