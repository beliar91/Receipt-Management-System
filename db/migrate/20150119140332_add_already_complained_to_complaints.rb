class AddAlreadyComplainedToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :already_complained, :boolean, default: false
  end
end
