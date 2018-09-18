class Status < ActiveRecord::Base 
  has_many :goal_statuses
  has_many :goals, through: :goal_statuses
end