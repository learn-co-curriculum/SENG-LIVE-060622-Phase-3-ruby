class Pet < ActiveRecord::Base
    #CREATE
    # Pet.new => Create a new instance, but it does not save it to the DB!
    # p.save => Will save the instance to the DB
    # Pet.create => Create a new instance AND save it to the DB
    #READ
    # Pet.all => returns all the pets
    # Pet.find(id) => finds a pet by the id
    # Pet.find_by({attribute:value}) => finds pet by an attribute 
    #UPDATE
    #DELETE
end 