class Owner
    #Connect Owner to Pet in a one to many
    attr_accessor :username, :email, :address, :phone
    def initialize(attributes = {})
        attributes.each do |att, value|
            self.send("#{att}=", value)
        end 
    end 
end 