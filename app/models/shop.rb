class Shop < ActiveRecord::Base

  include Tire::Model::Search
  include Tire::Model::Callbacks

  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: "niepoprawny" }

  geocoded_by :address
  after_validation :geocode


  validates_presence_of :name

  has_many :receipts
  belongs_to :user

  #def self.search(query)
    #where("name like ?", "%#{query}%")
  #end

  def address
    [street,city].compact.join(', ')
  end

  def name_with_city
    "#{name}: #{city}"
  end


  end


