class Savable
  
  @@all = {}

  def self.all
    @@all[self] ||= []
  end

  def self.create(attributes = {})
    self.new(attributes).save
  end

  def initialize(attributes = {})
    attributes.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
  end

  def save
    self.class.all << self
    self
  end
end