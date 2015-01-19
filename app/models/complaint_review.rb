class ComplaintReview < ActiveRecord::Base

  belongs_to :user
  belongs_to :complaint

  after_save :make_review


def sum_review_ratings
 client_approach+examination_time+satisfaction
end

def make_review

  self.complaint.update_column(:already_reviewed,true)

end


end
