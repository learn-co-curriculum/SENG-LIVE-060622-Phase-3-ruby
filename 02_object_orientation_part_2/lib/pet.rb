class Pet 
  attr_accessor :name, :age, :breed, :image_url, :last_fed_at, :last_walked_at

  @@all = []

  def initialize(attributes = {})
    attributes.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end

  def self.all
    @@all
  end

  def feed
    @last_fed_at = Time.now
  end 

  def print
    puts
    puts self.name.green
    puts "  Age: #{self.age}"
    puts "  Breed: #{self.breed}"
    puts "  Image Url: #{self.image_url}"
    puts formatted_feeding
    puts
  end

  private

  def formatted_feeding
    if self.last_fed_at.nil?
      "#{self.name} is hungry"
    end 
  end 




end 