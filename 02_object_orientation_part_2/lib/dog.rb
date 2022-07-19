class Dog < Pet


  def self.find_dog(name)
    @@all.find{|d| d.name == name }
  end 

  def self.list_all_names
    @@all.map{|d| d.name}
  end 

  # ✅ 3. instance method: 'walk' - updates the dog's last_walked_at property to the current time
  
  def walk
    @last_walked_at = Time.now
  end 

  # print details about a dog (including the last walked at and last fed at times)
  def print
    puts
    puts self.name.green
    puts "  Age: #{self.age}"
    puts "  Breed: #{self.breed}"
    puts "  Image Url: #{self.image_url}"
    puts "  Last walked at: #{self.last_walked_at}"
    puts "  Last fed at: #{self.last_fed_at}"
    puts
  end

  def fave_snack
    @@fave_snack
  end 

  # ✅ 5. private method: 'formatted_name' - returns the name of the dog color coded to indicate whether they are hungry or need a walk

  # ✅ 6. private method: 'format_time(time)' - accepts a time and returns it in a human readable format
  # should look like this: "Monday, 04/18/22 10:12 AM"

end

