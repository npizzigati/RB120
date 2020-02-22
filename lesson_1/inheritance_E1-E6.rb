# Create a superclass called Vehicle for your MyCar class to inherit
# from and move the behavior that isn't specific to the MyCar class to
# the superclass. Create a constant in your MyCar class that stores
# information about the vehicle that makes it different from other types
# of Vehicles.

# Then create a new class called MyTruck that inherits from your
# superclass that also has a constant defined that separates it from the
# MyCar class in some way.

# Create a module that you can mix in to ONE of your subclasses that
# describes a behavior unique to that subclass.

# Move all the methods from the MyCar class that also pertain to the MyTruck
# class into the Vehicle class. Make sure that all of your previous
# method calls are working when you are finished.

# Write a method called age that calls a private method to calculate the
# age of the vehicle. Make sure the private method is not available from
# outside of the class. You'll need to use Ruby's built-in Time class to
# help.

class Vehicle
  attr_accessor :color, :speed
  attr_reader :year
  @@num_vehicles = 0

  def self.total_vehicles
    @@num_vehicles
  end

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@num_vehicles += 1
  end

  def self.gas_mileage(miles, gallons)
    puts miles/gallons + " mpg"
  end

  def to_s
    "#{@year} #{@color} #{@model}"
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

  def how_old
    age
  end

  private

  def age
    Time.now.year - year
  end
  
end

module Towable
  def can_tow?
    true
  end
end

class MyCar < Vehicle
  @CARGO_CAPACITY = '500 kg'

  def initialize(year, color, model)
    super(year, color, model)
  end
end

class MyTruck < Vehicle
  @CARGO_CAPACITY = '1 ton'
  include Towable

  def initialize(year, color, model)
    super(year, color, model)
  end
end
