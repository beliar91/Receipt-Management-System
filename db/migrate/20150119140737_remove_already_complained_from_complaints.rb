class RemoveAlreadyComplainedFromComplaints < ActiveRecord::Migration
  def change
    remove_column :complaints, :already_complained
    add_column :articles, :already_complained, :boolean, default: false
  end
end
