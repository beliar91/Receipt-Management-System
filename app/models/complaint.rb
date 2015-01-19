class Complaint < ActiveRecord::Base

  after_save :make_complaint

  belongs_to :article
  belongs_to :user
  belongs_to :complaint_status
  has_many :complaint_reviews


  def make_complaint
    self.article.update_column(:already_complained,true)
  end

end
