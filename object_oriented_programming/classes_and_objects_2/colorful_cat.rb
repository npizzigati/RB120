# Colorful Cat
# Using the following code, create a class named Cat that prints a
# greeting when #greet is invoked. The greeting should include the name
# and color of the cat. Use a constant to define the color.

class Cat
  COLOR = 'purple'

  def initialize(name)
    @name = name
    @color = color
  end

  def greeting
    puts "Hello! My name is #{@name} and I'm a #{@color} cat!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
# Expected output:

# Hello! My name is Sophie and I'm a purple cat!
