def list_dogs
  $dogs_data.map{|hash| Dog.new(hash)}.map do |dog|
    dog.print
  end
  nil
end

def lennon 
  @lennon ||= Dog.create($dogs_data[5])
end

def olivia
  @olivia ||= Dog.create($dogs_data[0])
end