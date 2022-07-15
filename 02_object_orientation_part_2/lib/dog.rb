class Dog < Savable

  # # ✅ 1. class variable: all - holds all dogs we have saved
  # @@all = []

  # # ✅ 2. class method: 'all' - retrieves the value of the class variable
  # def self.all
  #   @@all
  # end

  # # ✅ 4. class method: 'create' - creates a new instances and saves it to the class variable
  # def self.create(attributes = {})
  #   self.new(attributes).save
  # end

  # # initialize with an optional hash of attributes
  # def initialize(attributes = {})
  #   attributes.each do |attribute, value|
  #     self.send("#{attribute}=", value)
  #   end
  # end

  attr_accessor :name, :age, :breed, :image_url, :last_fed_at, :last_walked_at

  # # ✅ 3. instance method: 'save' - saves this dog instance to our class variable
  # def save
  #   @@all << self
  #   self
  # end

  # ✅ 5. instance method: 'walk' - updates the dog's last_walked_at property to the current time
  def walk
    @last_walked_at = Time.now
  end
  
  # ✅ 6. instance method: 'feed' - updates the dog's last_fed_at property to the current time
  def feed
    @last_fed_at = Time.now
  end

  # print details about a dog (including the last walked at and last fed at times)
  def print
    puts
    puts self.name.green
    puts "  Age: #{self.age}"
    puts "  Breed: #{self.breed}"
    puts "  Image Url: #{self.image_url}"
    puts "  Last walked at: #{format_time(self.last_walked_at)}"
    puts "  Last fed at: #{format_time(self.last_fed_at)}"
    puts
  end


  private

  # ✅ 7. private method: 'formatted_name' - returns the name of the dog color coded to indicate whether they are hungry or need a walk
  def formatted_name
    if self.last_fed_at.nil? && self.last_walked_at.nil?
      "#{self.name} (hungry and needs a walk)".red
    elsif self.last_fed_at.nil?
      "#{self.name} (hungry)".red
    elsif self.last_walked_at.nil?
      "#{self.name} (needs a walk)".red
    else
      self.name.green
    end
  end

  # ✅ 8. private method: 'format_time(time)' - accepts a time and returns it in a human readable format
  # should look like this: "10:12 AM on 04/18/22"

  def format_time(time)
    time && time.strftime('%l:%M %p on %Y-%m-%d')
  end
end

