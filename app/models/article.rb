class Article < ActiveRecord::Base

  belongs_to :receipt
  belongs_to :user

  has_one :complaint

  before_save :set_warranty_expires
  before_save :set_current_user

  def name_with_brand
    "#{name} #{brand}"
  end

  def set_warranty_expires
    self.warranty_expires = self.receipt.shopping_date.advance(months: self.warranty_time)
  end

  def set_current_user
    self.user_id = self.receipt.user_id
  end



end
