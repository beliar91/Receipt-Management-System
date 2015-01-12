class Receipt < ActiveRecord::Base

  has_many :articles, dependent: :destroy

  has_attached_file :file, :styles => { :medium => "300x300", :small => "150x150", :thumb => "100x100>"}

  validates_attachment_size :file, :less_than => 10.megabytes

  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/

  validates_presence_of :shopping_date
  validates_presence_of :shop_id

  accepts_nested_attributes_for :articles, allow_destroy:true, :reject_if => :all_blank

  after_save :receipt_articles_count


  belongs_to :shop
  belongs_to :user

  def display_name
    self.name
  end

  def receipt_articles_count
    if self.articles.count ==0
      errors.add("Paragon", "musi miec przynajmniej 1 artykul")
      return false
    end
  end



end
