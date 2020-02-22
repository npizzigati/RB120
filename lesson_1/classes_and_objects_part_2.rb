# Add a class method to your MyCar class that calculates the gas mileage
# of any car.

# Override the to_s method to create a user friendly print out of your
# object.

class MyCar
  attr_accessor :color, :speed
  attr_reader :year

  def self.gas_mileage(miles, gallons)
    puts miles/gallons + " mpg"
  end

  def to_s
    "#{@year} #{@color} #{@model}"
  end

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
