class User < ActiveRecord::Base 
  has_many :goals
  has_many :objectives, through: :goals
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
end