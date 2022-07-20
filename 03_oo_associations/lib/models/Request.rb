class Request 
  #Request creats a many to many relationship between Handler and Pet

  #The request can be a walk or a drop-in visit
  
  attr_accessor :time, :notes, :request, :feed, :complete
  @@all = []
  def initialize(attributes = {})
    @time = attributes.time
    @notes = attributes.notes
    @feed = attributes.feed
    @complete = attributes.complete
    
    @@all << self
  end 

  #Class methods
  def self.all
    @@all
  end 

  #Instance methods

end