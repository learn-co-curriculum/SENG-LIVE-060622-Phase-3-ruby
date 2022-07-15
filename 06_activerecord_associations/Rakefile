# load up our dependencies and all our code
require_relative "./config/environment"

# load the rake tasks for interacting with the db
require 'sinatra/activerecord/rake'

desc "Open console"
task :console do
  # configures ActiveRecord to output generated SQL queries to the Standard Output while running
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end