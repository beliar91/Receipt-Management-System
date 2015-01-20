#encoding: utf-8
class Complaint < ActiveRecord::Base

  after_save :make_complaint


  belongs_to :article
  belongs_to :user
  belongs_to :complaint_status
  has_many :complaint_reviews

  validates_presence_of :article_id
  validates_presence_of :reason


  def make_complaint
    if !self.article_id.nil?
    self.article.update_column(:already_complained,true)
    end
  end

  def display_name
    self.reason
  end

end
