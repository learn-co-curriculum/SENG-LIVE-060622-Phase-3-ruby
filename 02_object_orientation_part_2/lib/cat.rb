require 'pry'
class Cat < Pet
    attr_accessor :indoor, :drop_in_vist

    def visit
        @drop_in_vist = Time.now
    end
end 

binding.pry