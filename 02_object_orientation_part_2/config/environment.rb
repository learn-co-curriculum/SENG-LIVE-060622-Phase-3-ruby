# require is like an import statement except it loads all methods from the required file (not just the default export)

# require pry so we can use binding.pry within our code
require "pry"

# require colorize to add the ability to print colored strings
require "colorize"

# use require_relative to load up our code in the lib directory
require_relative "../lib/cli_methods.rb"
require_relative "../lib/dog.rb"
require_relative "../lib/dogs_data.rb"

# add a method that will reload the lib/dog.rb file so we can 
# interact with the most recent version without restarting the console
# define a `reload` method to load the lib/dog.rb file:
def reload
  load "lib/dog.rb"
end