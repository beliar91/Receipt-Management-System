class RemoveComplaintIdFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :complaint_id, :integer
  end
end
