class CreateComplaintReviews < ActiveRecord::Migration
  def change
    create_table :complaint_reviews do |t|
      t.integer :examination_time
      t.integer :client_approach
      t.integer :satisfaction
      t.integer :complaint_id
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
  end
end
