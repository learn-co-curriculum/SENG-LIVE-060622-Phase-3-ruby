  # ✅ 1. make a helper method that will seed data

  def seed
    $dogs_data.each{|d| Dog.new(d)}
  end 