class Dog

  # ✅ 1. class variable: all - holds all dogs we have saved

  # ✅ 2. class method: 'all' - retrieves the value of the class variable

  # ✅ 4. class method: 'create' - creates a new instances and saves it to the class variable

  # initialize with an optional hash of attributes
  def initialize(attributes = {})
    attributes.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
  end

  attr_accessor :name, :age, :breed, :image_url, :last_fed_at, :last_walked_at

  # ✅ 3. instance method: 'save' - saves this dog instance to our class variable

  # ✅ 5. instance method: 'walk' - updates the dog's last_walked_at property to the current time
  
  # ✅ 6. instance method: 'feed' - updates the dog's last_fed_at property to the current time

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

  # ✅ 7. private method: 'formatted_name' - returns the name of the dog color coded to indicate whether they are hungry or need a walk

  # ✅ 8. private method: 'format_time(time)' - accepts a time and returns it in a human readable format
  # should look like this: "Monday, 04/18/22 10:12 AM"

end

