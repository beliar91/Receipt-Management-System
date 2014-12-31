class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.text :reason
      t.string :reject_reason
      t.integer :complaint_status_id

      t.timestamps
    end
  end
end
