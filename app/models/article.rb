class Article < ActiveRecord::Base

  belongs_to :receipt

  def name_with_brand
    "#{name} #{brand}"
  end


end
