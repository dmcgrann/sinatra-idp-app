class UserTraining < ActiveRecord::Base 
  belongs_to :training 
  belongs_to :user 
end