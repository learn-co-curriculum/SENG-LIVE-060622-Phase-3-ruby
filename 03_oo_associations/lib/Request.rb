class Request 
  #Request creats a job for our Hander
  #The request can be a walk or a drop-in visit
  # The request has an optional option of a feeding during the request
  #Connect the Request to a Pet and a Hander
  attr_accessor :time, :notes, :request :feed
  def initialize(attributes = {})
    attributes.each do |att, value|
        self.send("#{att}=", value)
    end 
  end 

end