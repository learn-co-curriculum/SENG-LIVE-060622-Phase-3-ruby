class DogsController < ApplicationController
  
  get "/dogs" do 
    if params.include?("include_dog_walks")
      Dog.includes(:walks).to_json(get_dog_json_config(
        include_dog_walks: true
      ))
    else
      Dog.all.to_json(get_dog_json_config)
    end
  end

  get "/dogs/:id" do 
    dog = Dog.find(params[:id])
    dog.to_json(get_dog_json_config(
      include_dog_walks: true
    ))
  end

  # ✅ we want to be able to create dogs through the API

  

  # ✅ we want to be able to update dogs through the API
  


  # ✅ we want to be able to delete dogs through the API





  private 

  def get_dog_json_config(include_dog_walks: false)
    options = { methods: [:age] }
    if include_dog_walk
      options.merge!({
        include: {
          dog_walks: {
            methods: [:formatted_time]
          }
        }
      })
    end
    options
  end

  # a method used to specify which keys are allowed through params into the controller
  # we use this method to create a list of what's permitted to be passed to .create or .update
  # within controller actions.
  def dog_params
    allowed_params = %w()
    allowed_params.select { |k,v| allowed_params.include?(k) }
  end

end