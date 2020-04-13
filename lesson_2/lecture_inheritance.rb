# Given this class:

# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end
# end

# class Bulldog < Dog
#   def swim
#     "can't swim!"
#   end
# end

# teddy = Dog.new
# puts teddy.speak           # => "bark!"
# puts teddy.swim           # => "swimming!"
# One problem is that we need to keep track of different breeds of dogs,
# since they have slightly different behaviors. For example, bulldogs
# can't swim, but all other dogs can.

# Create a sub-class from Dog called Bulldog overriding the swim method
# to return "can't swim!"

# Let's create a few more methods for our Dog class.

class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end
# Create a new class called Cat, which can do everything a dog can,
# except swim or fetch. Assume the methods do the exact same
# thing. Hint: don't just copy and paste all methods in Dog into Cat;
# try to come up with some class hierarchy.

class Dog < Pet
  def swim
    "swimming!"
  end

  def fetch
    "fetching!"
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

pete.run                # => "running!"
pete.speak              # => NoMethodError

kitty.run               # => "running!"
kitty.speak             # => "meow!"
kitty.fetch             # => NoMethodError

dave.speak              # => "bark!"

bud.run                 # => "running!"
bud.swim                # => "can't swim!"
