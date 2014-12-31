class AddArticleIdToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :article_id, :integer
  end
end
