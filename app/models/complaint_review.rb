class ComplaintReview < ActiveRecord::Base

  belongs_to :user
  belongs_to :complaint

  after_save :make_review

  validates_presence_of :complaint_id
  validates_presence_of :examination_time
  validates_presence_of :client_approach
  validates_presence_of :satisfaction


def sum_review_ratings
 client_approach+examination_time+satisfaction
end

def make_review

  self.complaint.update_column(:already_reviewed,true)

end

  def display_name
    self.comment
  end


end
