# Question 1
# Which of the following are objects in Ruby? If they are objects, how
# can you find out what class they belong to?

true
"hello"
[1, 2, 3, "happy days"]
142

# They are all objects. Their classes can be determined by calling
# #class on them

# Question 2

# If we have a Car class and a Truck class and we want to be able to
# go_fast, how can we add the ability for them to go_fast using the
# module Speed? How can you check if your Car or Truck can now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

# Include the module Speed in both classes. The call #go_fast on an
# instance of each class

# Question 3
# In the last question we had a module called Speed which contained a
# go_fast method. We included this module in the Car class as shown
# below.

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end
# When we called the go_fast method from an instance of the Car class
# (as shown below) you might have noticed that the string printed when
# we go fast includes the name of the type of vehicle we are using. How
# is this done?

# >> small_car = Car.new
# >> small_car.go_fast
# I am a Car and going super fast!

# A: In the #go_fast method, self refers to the caller object, and so
# self.class returns that objects class.
# Official answer adds: we don't need to add #to_s because the string
# interpolation takes care of that.

# Question 4
# If we have a class AngryCat how do we create a new instance of this
# class?

# The AngryCat class might look something like this:

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

# A: AngryCat.new
# Question 5
# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# Pizza has the instance variable @name, which is clear from the
# ampersand that precedes "name"

# Question 6
# What could we add to the class below to access the instance variable
# @volume?

class Cube
  def initialize(volume)
    @volume = volume
  end
end

# A: You could add a getter and setter:
def volume
  @volume
end

def volume=(volume)
  @volume = volume
end

# or an attribute accessor
attr_accessor :volume

# Question 7
# What is the default return value of to_s when invoked on an object?
# Where could you go to find out if you want to be sure?
# A: The default return value is "#<[Class name]:object_id (hex?)>"

# Question 8
# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end
# You can see in the make_one_year_older method we have used self. What
# does self refer to here?
# A: self refers to an instantiated object of the Cat class
# Official answer adds: ...that calls the method -- the calling object

# Question 9
# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end
# In the name of the cats_count method we have used self. What does self
# refer to in this context?
# A: This is a class method, so self refers to the calling class

# Question 10
# If we have the class below, what would you need to call to create a
# new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# A: Bag.new([color], [material])
