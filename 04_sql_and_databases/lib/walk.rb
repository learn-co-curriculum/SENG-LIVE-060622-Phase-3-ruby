class Walk < Savable
  attr_accessor :time

  def dog_walks
    DogWalk.all.select { |dw| dw.walk == self }
  end

  def dogs
    dog_walks.map { |dw| dw.dog }
  end
end