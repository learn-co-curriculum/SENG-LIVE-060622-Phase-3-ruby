## 1. OO Ruby pt1
### SWBAT

- [ ] Explain the purpose of Object Orientation and why it’s a popular design pattern
- [ ] Explain what a factory object is
- [ ] Observe how to create a class and an instance
- [ ] Explain the difference between a class and an instance
- [ ] Explain the difference between a getter and setter method
- [ ] Explain the purpose of mass assignment
- [ ] Observe initialization via mass assignment
- [ ] Observe how to use require to work with multiple files in a single document

### Deliverables

- use `require` and `require_relative` to load up required dependencies and code
- Create a Dog class 
- add an initialize method to allow instantiation via a hash of attributes
- Add attr_accessors for `name`, `age`, `breed`, `image_url`, `last_walked_at` and `last_fed_at`
- use data within `lib/dogs_data.rb` file to create instances of the dog class that respond to getters and setters.
- Add a `print` method to the dog class that will print out its information to the console.



## 2. OO Ruby pt2
### SWBAT

- [ ] Observe how to build class methods
- [ ] Explain the difference between a class method and instance method
- [ ] Explain self
- [ ] Explain what private methods are
- [ ] Explain inheritance in OO
- [ ] Observe inheritance in OO

### Deliverables

- add an `@@all` class variable
- add an `.all` method that retrieves all Dogs
- add a `#save` method that will save a Dog to `@@all`
- add a `.create` method that will create a new instance of the dog class and save it to `@@all`
- add a `#walk` method that will mark `last_walked_at` as the current time.
- add a `#feed` method that will mark `last_fed_at` as the current time.
- add a private method `formatted_time` that will return the name of the dog and a message in red if they need to be walked or fed, and the name of the dog in green if they have been both walked and fed.
- Demonstrate how we can use inheritance with a `Savable` class that defines `.all`, `.create` `save`, and `initialize` to reuse that code in multiple classes.
- Create a `Walk` class that inherits from `Savable` to demonstrate this in action.

## 3. OO associations
### SWBAT

- [ ] Explain what a relationship is in Object Orientation
- [ ] Explain the difference between a One to Many and Many to Many relationship
- [ ] Observe how relationships are built in Ruby
- [ ] Observe how to access associated instances


### Deliverables

- add `#dog` and `#dog=` methods to the `Feeding` class to indicate a one to one relationship between the two.
- add a `#feedings` method to the `Dog` class to indicate a one to many relationship between the two. 
- update the dog's `#feed` method so that it creates a new feeding that belongs to the dog.
  - **To Test**: If we call feed on a dog and pass in a time as an argument, we should then be able to call `feedings` on that dog and see an associated walk at the time we passed in.
- Implement many to many between dogs and walks:
  - create a `DogWalk` class to manage the relationship between:
    - a single dog and 
    - a single walk (via attr_accessors)
  - the `Dog` class should:
    - have a method `#dog_walks` that returns all of the dog_walks that are associated with that dog
    - have a `#walks` methods that returns all of the walks associated with that dog's `dog_walks`
  - The `Walk` class should:
    - have a method `#dog_walks` that returns all of the dog_walks that are associated with that walk
    - have a `#dogs` methods that returns all of the dogs associated with that walk's `dog_walks`
- update the dog's `walk` method so that it:
  - accepts a time as an argument
  - creates a walk at that time
  - creates a DogWalk belonging to the newly created walk and the receiving dog.
  - **To Test**: If we call walk on a dog and pass in a time as an argument, we should then be able to call `walks` on that dog and see an associated walk at the time we passed in.

## 4. SQL & Databases
### SWBAT

- [ ] Explain why we use databases
- [ ] Explain what SQL is and why we use it
- [ ] Explain the difference between a database, server, and API
- [ ] Explain the difference between rows and columns in a table
- [ ] Explain the difference between a foreign key and primary key
- [ ] Explain what a join table is
- [ ] Explain what it means to seed a database
- [ ] Observe using SQL to communicate with a database
- [ ] Explain what an ORM is and why we use Active Record

### Deliverables
- Set up DB so we can demo making SQL queries on example databases.


## 5. Intro to ActiveRecord
### SWBAT

- [ ] Review why we use Active Record
- [ ] Observe how to configure AR in Ruby applications
- [ ] Explain what a migration is 
- [ ] Observe creating & updating columns & tables w/ AR migrations
- [ ] Observe creating & updating rows w/ built in AR methods
- [ ] Observe how AR uses SQL “under the hood” to communicate with databases


### Deliverables

- create a migration to create the dogs table
- create another migration to add columns to the dogs table
- demonstrate rolling back and fixing a migration (explain that rolling back runs the migration in reverse, so the migration should be rolled back **before** fixing it)
- use `rake console` to:
  - create a dog instance and store in a variable
  - use `Dog.all` to see that the dog is now stored in the database
  - use setter methods to update its properties
  - reload from the database to see that the properties reset to their stored values
  - update the properties again and then call `save` on the dog, demonstrate that reloading keeps the updated value now
  - use the `update` method to update a property and then `reload` to demonstrate that update actually saves the new value to the database.
  - use the `destroy` method on the dog. Invoke `Dog.all` to see that the dog is no longer in the database

## 6. ActiveRecord Associations
### SWBAT

- [ ] Review domain modeling
- [ ] Review foreign vs primary keys
- [ ] Review rake and migrations
- [ ] Explain what macros are in Ruby classes
- [ ] Observe how to configure One to Many and Many to Many relationships using AR
- [ ] Observe using built in AR methods to access associated instances


### Deliverables

- create a `Feeding` class that inherits from `ActiveRecord::Base` 
- add the `belongs_to` association so we can establish a 1-1 relationship between a Feeding and a Dog.

## 7. Web API with Sinatra 
### SWBAT

- [ ] Review databases vs servers vs APIs
- [ ] Review client-side vs server-side routing
- [ ] Review HTTP verbs
- [ ] Explain what MVC is and why it’s a popular pattern
- [ ] Observe how to create a controller and handle routing w/ controller actions
- [ ] Observe how to create dynamic routes
- [ ] Explain what params are and how to access them
- [ ] Observe using Postman to test server-side routes


### Deliverables

- first

## 8. Full CRUD Web API with Sinatra 
### SWBAT

- [ ] Review MVC
- [ ] Review dynamic routing
- [ ] Review params
- [ ] Observe how to build POST, PATCH, and DELETE/DESTROY routes w/ Sinatra controller actions


### Deliverables

- first
