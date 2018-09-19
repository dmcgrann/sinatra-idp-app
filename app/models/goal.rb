class Goal < ActiveRecord::Base 
  belongs_to :user
  has_many :objectives
end