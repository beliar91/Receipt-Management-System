#encoding: utf-8
class Shop < ActiveRecord::Base

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks


  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: "niepoprawny format" }, :allow_blank => true, :if => :email?
  validates_presence_of :name

  #validates_length_of :telephone, :minimum => 9, :maximum => 11, :message => "musi zawierać 9 cyfr", :allow_blank => true





  geocoded_by :address
  after_validation :geocode




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


