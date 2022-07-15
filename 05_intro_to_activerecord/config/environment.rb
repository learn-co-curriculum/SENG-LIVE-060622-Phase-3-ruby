ENV["AR_ENVIRONMENT"] ||= "development"
# require is like an import statement except it loads all methods from the required file (not just the default export)
require "bundler/setup"
# Here we're calling a method that requires all of the ruby gems in the default environment (not in a group like development or test) For our purposes, this will load require_all and pry so that we can use `require_all` and `binding.pry` within our code
Bundler.require(:default, ENV["AR_ENVIRONMENT"])

# set the default time zone to local time for activerecord
ActiveRecord::Base.default_timezone = :local

# use require_all to load up all our code in the lib directory
require_all "lib"