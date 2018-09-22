class User < ActiveRecord::Base 
  has_secure_password
  has_many :goals
  has_many :objectives, through: :goals
end