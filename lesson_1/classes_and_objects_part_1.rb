# Create a class called MyCar. When you initialize a new instance or
# object of the class, allow the user to define some instance variables
# that tell us the year, color, and model of the car. Create an instance
# variable that is set to 0 during instantiation of the object to track
# the current speed of the car as well. Create instance methods that allow
# the car to speed up, brake, and shut the car off.

class MyCar
  attr_accessor :color, :speed
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up
    self.speed += 5
  end

  def brake
    self.speed -= 5
  end

  def shut_off
    self.speed = 0
  end

  def spray_paint(color)
    self.color = color
  end
end

# Add an accessor method to your MyCar class to change and view the color
# of your car. Then add an accessor method that allows you to view, but
# not modify, the year of your car.

# You want to create a nice interface that allows you to accurately
# describe the action you want your program to perform. Create a method
# called spray_paint that can be called on an object and will modify the
# color of the car.
