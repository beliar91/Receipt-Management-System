class Article < ActiveRecord::Base

  belongs_to :receipt

  has_one :complaint

  before_save :set_warranty_expires

  def name_with_brand
    "#{name} #{brand}"
  end

  def set_warranty_expires
    self.warranty_expires = self.receipt.shopping_date.advance(months: self.warranty_time)
  end



end
