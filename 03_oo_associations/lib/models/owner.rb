class Owner
    #Connect Owner to Pet in a one to many
    attr_accessor :username, :email, :address, :phone
    @@all = []
    def initialize(attributes = {})
        @username = attributes.username
        @email = attributes.email
        @address = attributes.address
        @phone = attributes.phone
        @@all << self
    end 

    #.Class methods
    def self.all
        @@all
    end 
    
    #Instance methods
end 