## 3. OO Associations

### SWBAT

- [ ] Explain what a relationship is in Object Orientation
- [ ] Explain the difference between a One to Many and Many to Many relationship
- [ ] Observe how relationships are built in Ruby
- [ ] Observe how to access associated instances


### Deliverables

- add a `Feeding` class to the application that inherits from `Savable`
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
  - creates a walk at the current time
  - creates a DogWalk belonging to the newly created walk and the receiving dog.
  - returns new newly created walk
  - **To Test**: If we call walk on a dog and pass in a time as an argument, we should then be able to call `walks` on that dog and see an associated walk at the time we passed in.