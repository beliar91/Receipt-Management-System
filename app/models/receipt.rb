class Receipt < ActiveRecord::Base

  has_many :articles, dependent: :destroy

  has_attached_file :file, :styles => { :medium => "300x300", :small => "150x150", :thumb => "100x100>"}

  validates_attachment_size :file, :less_than => 10.megabytes

  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/

  accepts_nested_attributes_for :articles, allow_destroy:true, :reject_if => :all_blank


  belongs_to :shop
  belongs_to :user



end
