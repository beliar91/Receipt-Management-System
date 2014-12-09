class Receipt < ActiveRecord::Base


  has_attached_file :file, :styles => { :medium => "300x300", :small => "150x150", :thumb => "100x100>"}

  validates_attachment_size :file, :less_than => 10.megabytes

  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/

  belongs_to :shop
  belongs_to :user




end
