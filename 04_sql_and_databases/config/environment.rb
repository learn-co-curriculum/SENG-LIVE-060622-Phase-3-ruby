# require is like an import statement except it loads all methods from the required file (not just the default export)

# require pry so we can use binding.pry within our code
require "pry"

# require colorize to add the ability to print colored strings
require "colorize"

# use require_relative to load up our code in the lib directory
require_relative "../lib/helper_methods.rb"
require_relative "../lib/savable.rb"
require_relative "../lib/dog.rb"
require_relative "../lib/dog_walk.rb"
require_relative "../lib/walk.rb"
require_relative "../lib/feeding.rb"
require_relative "../lib/dogs_data.rb"

require "sqlite3" 

DOGS_DB = SQLite3::Database.new("db/dog_walker/dog_walker.db")
DOGS_DB.results_as_hash = true

APPTS_DB = SQLite3::Database.new("db/appointments/appointments.db")
APPTS_DB.results_as_hash = true

RECIPES_DB = SQLite3::Database.new("db/recipes/recipes.db")
RECIPES_DB.results_as_hash = true

# add a method that will reload the lib/dog.rb file so we can 
# interact with the most recent version without restarting the console
# define a `reload` method to load the lib/dog.rb file:
def reload
  load "lib/dog.rb"
  load "lib/walk.rb"
  load "lib/feeding.rb"
  load "lib/dog_walk.rb"
end