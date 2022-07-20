class Cat < Pet
    attr_accessor :indoor, :drop_in_visit
    def self.all
        @@all.filter{|p| p.class == self}
    end 
    
    def visit
        @drop_in_visit = Time.now
    end

end 