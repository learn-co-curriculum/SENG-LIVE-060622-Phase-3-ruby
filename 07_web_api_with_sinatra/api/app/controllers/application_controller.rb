class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # endpoint: path that is available for a request and respond with some data

  # http verb + path(endpoint) + logic that defines the response 

  get '/welcome' do 
    "This is a welcome page"
  end

end
