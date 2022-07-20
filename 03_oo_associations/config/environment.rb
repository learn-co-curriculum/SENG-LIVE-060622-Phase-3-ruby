# require is like an import statement except it loads all methods from the required file (not just the default export)

# require pry so we can use binding.pry within our code
require "pry"

# require colorize to add the ability to print colored strings
require "colorize"

# use require_relative to load up our code in the lib directory
require_relative "../lib/models/pet.rb"
require_relative "../lib/models/cat.rb"
require_relative "../lib/models/dog.rb"
require_relative "../lib/models/handler.rb"
require_relative "../lib/models/owner.rb"
require_relative "../lib/models/request.rb"
require_relative "../lib/data.rb"
require_relative "../lib/helper_methods.rb"



# add a method that will reload the lib/dog.rb file so we can 
# interact with the most recent version without restarting the console
# define a `reload` method to load the lib/dog.rb file:
def reload
  load "lib/models/dog.rb"
  load "lib/models/cat.rb"
  load "lib/models/pet.rb"
  load "lib/data.rb"
  load "lib/models/handler.rb"
  load "lib/models/owner.rb"
  load "lib/modelsrequest.rb"
  load "lib/helper_methods.rb"

  seed
end