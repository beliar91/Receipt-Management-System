class Article < ActiveRecord::Base

  belongs_to :receipt

  has_one :complaint

  def name_with_brand
    "#{name} #{brand}"
  end


end
