class Complaint < ActiveRecord::Base

  belongs_to :article
  belongs_to :user
  belongs_to :complaint_status


end
