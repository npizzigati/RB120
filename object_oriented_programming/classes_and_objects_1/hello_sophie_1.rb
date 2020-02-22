# Using the code from the previous exercise, add an #initialize method
# that prints I'm a cat! when a new Cat object is initialized.

# Code:

class Cat
  def initialize(name) 
    @name = name
  end

  def greet
    puts "Hello! My name is #{@name}"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
