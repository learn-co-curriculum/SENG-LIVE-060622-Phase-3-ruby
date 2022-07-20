class Handler
    attr_accessor :name, :email, :phone
    @@all = []
    def initialize(attributes={})
        @name = attributes.name
        @email = attributes.email
        @phone = attributes.phone
        @@all << self
    end 

    #.Class methods
    def self.all
        @@all
    end 

    #Instance Methods 
end 