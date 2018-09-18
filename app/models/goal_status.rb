class GoalStatus < ActiveRecord::Base 
  belongs_to :goal 
  belongs_to :status
end