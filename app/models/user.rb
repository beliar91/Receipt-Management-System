class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :shops
  has_many :receipts
  has_many :complaints
  has_many :static_pages

  def display_name
    self.email
  end

end
