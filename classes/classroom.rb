class Classroom
  attr_accessor :lable, :students

  def initialize(lable)
    @lable = lable
    @students = []
  end

  def add_students(student)
    @students << student
    student.classroom = self
  end
end
