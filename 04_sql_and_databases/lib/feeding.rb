class Feeding < Savable

  attr_accessor :time, :dog

  # an approach using the dog's object_id instead of the entire instance 
  # this is more like what we'll do when we have a database later on
  
  # attr_accessor :dog_id
  # def dog=(dog)
  #   self.dog_id = dog.object_id
  # end

  # def dog
  #   Dog.all.find{|dog| dog.object_id == self.dog_id}
  # end

end