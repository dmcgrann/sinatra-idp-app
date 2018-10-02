class User < ActiveRecord::Base 
  has_secure_password
  validates :username, uniqueness: true
  has_many :goals
  has_many :objectives, through: :goals
end