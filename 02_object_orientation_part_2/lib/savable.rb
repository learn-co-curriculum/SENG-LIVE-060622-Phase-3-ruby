class Savable
  # ✅ 1. class variable: all - holds all objects we have saved
  @@all = {}

  # ✅ 2. class method: 'all' - retrieves the value of the class variable
  def self.all
    @@all[self] ||= []
  end

  # ✅ 4. class method: 'create' - creates a new instances and saves it to the class variable
  def self.create(attributes = {})
    self.new(attributes).save
  end

  # initialize with an optional hash of attributes
  def initialize(attributes = {})
    attributes.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
  end

  # ✅ 3. instance method: 'save' - saves this dog instance to our class variable
  def save
    self.class.all << self
    self
  end
end