class PetsController < ApplicationController

  # read all the pets index 
  get '/pets' do 
    pets = Pet.all
    pets.to_json # take the eruby objects and turn them into JSON
  end

  # show page: it shows the details of one individual pet 
  # well how do we get and retreive the pet that the user made a request for 
  # what does the endpoint look like 

  # dynamic routes
  get '/pets/:id' do 
    # we're going to receive a params hash
    # 1. using a dynamic route will create a key/value 
    # 2. by submitting some information
    # params = {"id"=>"3"}
    pet = Pet.find(params[:id])
    pet.to_json
  end

  # create: allow us to create a new pet

  post '/pets' do 
    # create a pet 
    # Pet.create(name: params[:name], breed: params[:breed], age: params[:age])
    pet = Pet.create(params)
    # {"name"=>"Zoie", "breed"=>"Daschund", "age"=>2, "image_url"=>"www.img.com"}
    pet.to_json
  end

  # update: I want to update a single pet
  patch '/pets/:id' do 
    pet = Pet.find(params[:id])
    pet.update(params)
    pet.to_json
  end

  # I want to delete a single pet

  delete '/pets/:id' do 
    pet = Pet.find(params[:id])
    pet.destroy
  end

  # return all the pets requests that are from 1 day ago 

  get '/pets/:id/recent_requests' do 
    pet = Pet.find(params[:id])
    pet.requests.where("time > ?", 1.hour.ago).to_json
  end

  private 

  # strong params: a list of permitted params

  def pet_params 
    params.permit(:name, :breed, :age, :image_url)
  end

end