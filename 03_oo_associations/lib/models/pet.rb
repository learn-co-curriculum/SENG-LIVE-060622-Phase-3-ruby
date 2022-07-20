class Pet 
    #Super class to Dog and Cat
    #Pet has a one-to-many relationship with Owner
    attr_accessor :name, :age, :breed, :image_url, :last_fed_at

    @@all = []
    #Mass assignment example
    def initialize(attributes = {})
        attributes.each do |attribute, value|
          self.send("#{attribute}=", value)
        end
        @@all << self
    end

    #.Class methods
    def self.all
        @@all
    end

    def self.pet_names
        @@all.map{|p| p.name}
    end 

    #Instance methods
    def print
        puts
        puts self.name.green
        puts "  Age: #{self.age}"
        puts "  Breed: #{self.breed}"
        puts "  Image Url: #{self.image_url}"
        puts "  Last fed at: #{format_time(self.last_fed_at)}"
        puts
    end

    
private
    
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
    

    def format_time(time)
        #strftime formats the date acording to the directives in the given format string
        time && time.strftime('%l:%M %p on %Y-%m-%d')
    end
end 