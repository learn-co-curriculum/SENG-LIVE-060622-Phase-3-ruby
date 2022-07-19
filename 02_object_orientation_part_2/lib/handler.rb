class Handler
    # def initialize(name, email, phone)
    #     @name = name
    #     @email = email
    #     @phone = phone
    # end 
    attr_accessor :name, :email, :phone
    def initialize(attributes = {})
        attributes.each do |att, value|
            self.send("#{att}=", value)
        end 
    end 
end 