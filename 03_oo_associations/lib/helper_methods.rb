#Creates instances of our classes using our data.
def seed_dogs
  $dogs_data.each{|d| Dog.new(d)}
end 

def seed_cats
  $cats_data.each{|c| Cat.new(c)}
end 

def seed_owners
  $owner_data.each{|o| Owner.new(o)}
end

def seed_handlers
  $handler_data.each{|h| Handler.new(h)}
end 

def seed
  seed_dogs
  seed_cats
  seed_owners
  seed_handlers
end 