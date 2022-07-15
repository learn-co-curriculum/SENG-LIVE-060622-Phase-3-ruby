class WalksController < ApplicationController

  get "/walks" do 
    if params.include?("include_dogs")
      Walk.includes(:dogs).to_json(get_walk_json_config(include_dogs: true))
    else
      Walk.all.to_json(get_walk_json_config)
    end
  end

  get "/walks/recent" do 
    Walk.recent.to_json(get_walk_json_config)
  end

  get "/walks/:id" do 
    walk = Walk.find(params[:id])
    walk.to_json(get_walk_json_config(include_dogs: params.include?("include_dogs")))
  end

  # ✅ we want to be able to create walks through the API
  
  


  # ✅ we want to be able to update walks through the API
  



  # ✅ we want to be able to delete walks through the API
  


  

  private 

  def get_walk_json_config(include_dogs: false)
    options = { methods: [:formatted_time] }
    if include_dogs
      options.merge!({
        include: {
          dogs: {
            only: [:id, :name, :image_url]
          }
        }
      })
    end
    options
  end

  # a method used to specify which keys are allowed through params into the controller
  # we use this method to create a list of what's permitted to be passed to .create or .update
  # within controller actions.
  def walk_params
    allowed_params = %w()
    allowed_params.select { |k,v| allowed_params.include?(k) }
  end
end