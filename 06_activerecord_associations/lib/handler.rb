class Handler < ActiveRecord::Base
  has_many :requests 
  has_many :pets, through: :requests
end