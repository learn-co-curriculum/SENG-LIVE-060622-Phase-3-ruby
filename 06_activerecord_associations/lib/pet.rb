class Pet < ActiveRecord::Base 

  # macro: piece of code that returns code
  # macro is a class method that returns instance methods 
  belongs_to :owner
  has_many :requests 
  has_many :handlers, through: :requests
  # .handlers 
  # .handlers << handler

  # we get a collection of methods that will allow to us to do a few things

  # setter method: .owner=(owner)
  # getter method: .owner
  # create the associated object and associate it with the pet at the same time: build_owner(owners_attribtues)
  
end