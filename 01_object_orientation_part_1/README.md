## 1. OO Ruby pt1
### SWBAT

- [ ] Explain the purpose of Object Orientation and why it’s a popular design pattern
- [ ] Explain what a factory object is
- [ ] Observe how to use require to work with multiple files in a single document
- [ ] Observe how to create a class and an instance
- [ ] Explain the difference between a class and an instance
- [ ] Explain the difference between a getter and setter method
- [ ] Explain the purpose of mass assignment
- [ ] Observe initialization via mass assignment

### Deliverables

- use the `bundle add` command to install the `pry` and `colorize` gems
- use `require` and `require_relative` to load up required dependencies and code (within `config/environment.rb`)
- Create a Dog class 
- add an initialize method to allow instantiation (first with a series of arguments, then via a hash of attributes)
- Add `attr_accessors` for `name`, `age`, `breed`, `image_url`, `last_walked_at` and `last_fed_at`
- use data within `lib/dogs_data.rb` file to create instances of the dog class that respond to getters and setters.
- Add a `print` method to the dog class that will print out its information to the console.

## Situations Where Object Oriented Design is well suited
>I want to have total control of what my objects look like by updating my class.

Here are some characteristics of applications that would lend themselves well to an OO design

- an application modeling a real world domain that has lots of government regulations with specific data storage requirements (health care, banking, insurance, etc.)
- an application designed to help workers accomplish well established tasks that have consistent data requirements (sales, eCommerce, accounting, booking software for restaurants or hotels) 

Object Oriented design would help me clearly define the responsibilities of the different objects in my program and how they are related to other objects in the program. 

#### Situations where object oriented design presents obstacles
>Because I have total control, I don't have the flexibility to change my object's attributes without changing my class first.

If I were building a social media application, being able to iterate quickly and experiment with new features without having to make a more significant commitment to a change is a benefit. If we're in a situation where we're interacting with data from multiple external sources and we don't have control over the attributes present, an object oriented approach can slow us down. Think about the difference between having a Dog class and having a hash containing information about the dog. If we want to add information to the dog hash, we just add it, but if we want Dog instances to have more information attached to them, we have to change the class first.

#### Strengths
- It models the real world very well.
- OOP offers code reusability. The ability to encapsulate data and behavior within classes allows us to model relationships between different ideas and real world objects quite accurately.
- Different classes allow us to easily implement separation of concerns throughout our application.

#### Challenges
- OOP code is generally slower than functional code. 
- Testing Object Oriented code requires more setup
- Because so much abstraction is involved, if we're building an application where our requirements are rapidly changing, committing to the wrong abstraction can require more work to refactor and adjust than it would with functional code.

If you're looking for a clear and concise example of how to recognize OO vs functional code, consider the following:

```rb
# Functional
def print_dog(dog_hash)
  # ...
end

print_dog(dog_hash)

# Object Oriented
class Dog
  def print
    # ...
  end
end

dog = Dog.new
dog.print
```

## Resources
- [Destructuring in Ruby](https://jsarbada.wordpress.com/2019/02/05/destructuring-with-ruby/)
- [Difference between require & require_relative in ruby](https://stackoverflow.com/questions/3672586/what-is-the-difference-between-require-relative-and-require-in-ruby)