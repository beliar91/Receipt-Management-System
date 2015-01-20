class AddAlreadyReviewedToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :already_reviewed, :boolean, default: false
  end
end
