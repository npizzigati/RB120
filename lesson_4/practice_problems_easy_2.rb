# Question 1
# You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end
# What is the result of executing the following code:

oracle = Oracle.new
oracle.predict_the_future

# It returns "You will " followed by a random phrase from the choices
# array

# Question 2
# We have an Oracle class and a RoadTrip class that inherits from the
# Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end
# What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future

# A: This will print the same "You will " followed now by one of the
# choices in the #choices method in Roadtrip

# Question 3
# How do you find where Ruby will look for a method when that method is
# called? How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end
# What is the lookup chain for Orange and HotSauce?

# A: Ruby first looks in the class, and then successively in that
# classes ancestors. Modules included in a class are looked up before
# the next class in the hierarchy. Calling the #ancestors method on a class will
# return a list of the class's ancestors.
# The lookup chain for Orange is Orange -> Taste and the chain for
# HotSauce is HotSauce -> Taste. (Both chains end with Object -> Kernel
# -> BasicObject)

# Question 4
# What could you add to this class to simplify it and remove two methods
# from the class definition while still maintaining the same
# functionality?

class BeesWax
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

# A: You could replace the getter and setter with
attr_accessor :type

# Question 5
# There are a number of variables listed below. What are the different
# types and how do you know which is which?

excited_dog = "excited dog"
@excited_dog = "excited dog"
@@excited_dog = "excited dog"

# A: The first type is a local variable, the second, an instance
# variable, and the third is a class variable. The ampersands tell you
# which is which.

# Question 6
# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end
# Which one of these is a class method (if any) and how do you know? How
# would you call a class method?

# A: self#manufacturer is a class method (the "self" in this case refers
# to the class). You call a class method on the class (and not an
# instance of the class).

# Question 7
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
# Explain what the @@cats_count variable does and how it works. What
# code would you need to write to test your theory?

# A: @@cats_count keeps track of the number of instantiated objects of
# the Cat class. It does this because it is called in the initialize
# method of the class, which is called each time a new instance is
# instantiated. To test this theory, I would run the following code:

whiskers = Cat.new(:siamese)
clark = Cat.new(:calico)
Cat.cats_count # => expecting 2 

# Question 8
# If we have this class:

class Game
  def play
    "Start the game!"
  end
end
And another class:

class Bingo
  def rules_of_play
    #rules of play
  end
end
# What can we add to the Bingo class to allow it to inherit the play
# method from the Game class?

# A: Change the class declaration line to read: "class Bingo < Game"

# Question 9
# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end
# What would happen if we added a play method to the Bingo class,
# keeping in mind that there is already a method of this name in the
# Game class that the Bingo class inherits from.

# Solution 9: The new play method would override the method in the Game
# class

# Question 10
# What are the benefits of using Object Oriented Programming in Ruby? Think of as many as you can.
# Polymorphism, Inheritance and Encapsulation. Being able to shrink
# methods thanks to the class namespace with instance variables.
