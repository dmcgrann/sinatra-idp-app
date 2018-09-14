class User < ActiveRecord::Base 
  has_secure_password
  has_many :goals 
  has_many :user_trainings
  has_many :trainings, through: :user_trainings
end