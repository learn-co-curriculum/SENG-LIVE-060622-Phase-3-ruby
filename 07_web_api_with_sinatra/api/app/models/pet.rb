class Pet < ActiveRecord::Base 
  belongs_to :owner
  has_many :requests 
  has_many :handlers, through: :requests  
end