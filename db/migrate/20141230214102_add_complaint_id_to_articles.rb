class AddComplaintIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :complaint_id, :integer
  end
end
