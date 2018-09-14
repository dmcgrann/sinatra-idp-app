class Training < ActiveRecord::Base
  has_many :user_trainings
  has_many :users, through: :user_trainings
end