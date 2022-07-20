class Dog < Pet
  attr_accessor :last_walked_at

  def self.all
    @@all.filter{|p| p.class == self}
  end 

  
  def walk
    @last_walked_at = Time.now
  end

  def greet
    super
    puts "Who's a good pupper??"
  end
end

