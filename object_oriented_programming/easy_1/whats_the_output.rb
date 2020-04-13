# What's the Output?
# Take a look at the following code:

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

# puts
# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name
# What output does this code print? Fix this class so that there are no
# surprises waiting in store for the unsuspecting developer.

# Output before change

# puts fluffy.name => Fluffy
# puts fluffy => My name is FLUFFY
# puts fluffy.name => FLUFFY
# puts name => FLUFFY

# Further Exploration
# What would happen in this case? s fc fc 

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name # 42
puts fluffy
puts fluffy.name
puts name
