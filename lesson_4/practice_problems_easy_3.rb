# Question 1
# If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
# What happens in each of the following cases:

# case 1:
hello = Hello.new
hello.hi
# outputs "Hello"

# case 2:
hello = Hello.new
hello.bye
# throws an uncaught NoMethodError

# case 3:
hello = Hello.new
hello.greet
# throws an uncaught exception for improper number of arguments
# ArgumentError

# case 4:
hello = Hello.new
hello.greet("Goodbye")
# outputs "Goodbye"


# case 5:
Hello.hi
# NoMethod error

# Question 2
# In the last question we had the following classes:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
# If we call Hello.hi we get an error message. How would you fix this?

# Solution 2: Either instantiate a Hello object and call #hi on that, or
# change #hi to a class method (self.hi)

# Question 3
# When objects are created they are a separate realization of a particular class.

# Given the class below, how do we create two different instances of this class, both with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

# Solution 3: a = AngryCat.new(1, 'whiskers'); b = AngryCat.new(2, 'paws')

# Question 4
# Given the class below, if we created a new instance of the class and
# then called to_s on that instance we would get something like
# "#<Cat:0x007ff39b356d30>"

class Cat
  def initialize(type)
    @type = type
  end
end

# How could we go about changing the to_s output on this method to look
# like this: I am a tabby cat? (this is assuming that "tabby" is the
# type we passed in during initialization).

# Solution 4: Include the following method in the class:
def to_s
  "I am a #{@type} cat."
end

# Question 5
# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end
# What would happen if I called the methods like shown below?

# tv = Television.new => instantiates the tv object
# tv.manufacturer => NoMethodError -- manufacturer is a class method
# tv.model => will call the instance method #model

# Television.manufacturer
# Television.model

# Question 6
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
# In the make_one_year_older method we have used self. What is another
# way we could write this method so we don't have to use the self
# prefix?

# Solution 6: We could use the instance variable @age.

# Question 7
# What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

# A: The self.information method seems fairly useless.
# Official answer: the return statement is unnecessary.
