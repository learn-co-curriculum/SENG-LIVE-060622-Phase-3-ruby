class Owner < ActiveRecord::Base 
  has_many :pets
  # a has many relationship: we're going to get back an array 

  # .pets: reader method, we are going to get back an array of all the pets that belong to this owner
  # .pets<<(pet): setter method, we are adding a new element to the collection 



end