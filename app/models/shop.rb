#encoding: utf-8
class Shop < ActiveRecord::Base

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks


  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: "niepoprawny format" }, :allow_blank => true, :if => :email?
  validates :email, uniqueness: true
  validates_presence_of :name
  validates :name, uniqueness: true
  validates :telephone, length: { is: 15}

  geocoded_by :address
  after_validation :geocode

  has_many :receipts
  belongs_to :user

  def address
    [street,city].compact.join(', ')
  end

  def name_with_city
    "#{name}: #{city}"
  end




  end


