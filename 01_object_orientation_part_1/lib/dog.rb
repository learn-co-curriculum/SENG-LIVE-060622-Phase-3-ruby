class Dog
  # ✅ we should be able to create dogs with a name, age, breed, and image_url

  # initialize with a series of arguments
  # def initialize(name, age, breed, image_url)
  #   @name = name
  #   @age = age
  #   @breed = breed
  #   @image_url = image_url
  # end

  # initialize with an optional hash of attributes
  def initialize(attributes = {})
    attributes.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
  end

  # ✅ we want to be able to access a dog's name, age, breed, image_url, last_fed_at and last_walked at times

  attr_accessor :name, :age, :breed, :image_url, :last_fed_at, :last_walked_at

  # # attr_accessor :name defines both of the following
  
  # # attr_reader :name
  # def name
  #   @name
  # end

  # # attr_writer :name
  # def name=(name)
  #   @name = name
  # end


  # ✅ we want to be able to print details about a dog (this time including the last walked at and last fed at times)
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

end