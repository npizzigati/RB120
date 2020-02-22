# Lecture: Classes and Objects
# As you know by now, classes are the blueprints for objects. Below are
# some practice problems that test your knowledge of the connection
# between classes and objects.

# Given the below usage of the Person class, code the class definition.

# class Person
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end
# end
# bob = Person.new('bob')
# bob.name                  # => 'bob'
# bob.name = 'Robert'
# bob.name                  # => 'Robert'

# Modify the class definition from above to facilitate the following
# methods. Note that there is no name= setter method now.

# class Person
#   attr_accessor :first_name, :last_name
#   def initialize(name)
#     self.first_name = name
#     self.last_name = ''
#   end

#   def name
#     last_name ? "#{first_name} #{last_name}" : first_name
#   end
# end

# bob = Person.new('Robert')
# bob.name                  # => 'Robert'
# bob.first_name            # => 'Robert'
# bob.last_name             # => ''
# bob.last_name = 'Smith'
# bob.name                  # => 'Robert Smith'
# Hint: let first_name and last_name be "states" and create an instance
# method called name that uses those states.

# Possible Solution
# Now create a smart name= method that can take just a first name or a
# full name, and knows how to set the first_name and last_name
# appropriately.

class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    assign(name)
  end

  def assign(name)
    first, _, last = name.partition(' ')
    self.first_name = first.strip
    self.last_name = last.strip
  end

  def name
    if last_name == ""
      first_name
    else
      "#{first_name} #{last_name}"
    end
  end

  def name=(name)
    assign(name)
  end

  def to_s
    name
  end
end

# bob = Person.new('Robert')
# bob.name                  # => 'Robert'
# bob.first_name            # => 'Robert'
# bob.last_name             # => ''
# bob.last_name = 'Smith'
# bob.name                  # => 'Robert Smith'

# bob.name = "John Adams"
# bob.first_name            # => 'John'
# bob.last_name             # => 'Adams'

# Using the class definition from step #3, let's create a few more
# people -- that is, Person objects.
# bob = Person.new('Robert Smith')
# rob = Person.new('Robert Smith')
# If we're trying to determine whether the two objects contain the same
# name, how can we compare the two objects?

# Possible Solution
# Continuing with our Person class definition, what does the below print out?

# bob = Person.new("Robert Smith")
# puts "The person's name is: #{bob}"
# See Output
# Let's add a to_s method to the class:

# class Person
#   # ... rest of class omitted for brevity

#   def to_s
#     name
#   end
# end
# Now, what does the below output?

# bob = Person.new("Robert Smith")
# puts "The person's name is: #{bob}"
