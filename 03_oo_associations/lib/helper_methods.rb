def seed
  $dogs_data.each{|d| Dog.new(d)}
  $cats_data.each{|c| Cat.new(c)}
end 