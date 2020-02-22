# Create a class 'Student' with attributes name and grade. Do NOT make
# the grade getter public, so joe.grade will raise an error. Create a
# better_grade_than? method, that you can call like so...

# puts "Well done!" if joe.better_grade_than?(bob)

class Student
  attr_accessor :public_grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than(other)
    public_grade > other.public_grade
  end

  def public_grade
    @grade
  end
end
