class Goal < ActiveRecord::Base 
  belongs_to :user
  has_many :goal_statuses
  has_many :statuses, through: :goal_statuses
end