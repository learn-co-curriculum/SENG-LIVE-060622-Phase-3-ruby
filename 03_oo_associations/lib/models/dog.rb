class Dog < Pet
  #Dog inherits from Pet
  #attributes unique to Dog
  attr_accessor :last_walked_at

  #.Class Method
  def self.all
    @@all.filter{|p| p.class == self}
  end 

  #Instance Method
  def walk
    @last_walked_at = Time.now
  end

  def greet
    super
    puts "Who's a good pupper??"
  end
end

