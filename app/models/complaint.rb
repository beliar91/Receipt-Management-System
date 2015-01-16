class Complaint < ActiveRecord::Base

  belongs_to :article
  belongs_to :user
  belongs_to :complaint_status
  has_many :complaint_reviews

end
