require_relative '../classroom'
require_relative '../student'

describe Classroom do
  context 'Create classroom and add students' do
    it 'should create a classroom' do
      classroom = Classroom.new('Anthropology')
      expect(classroom).to be_a Classroom
    end

    it 'should admit students in the classroom' do
      classroom = Classroom.new('Anthropology')
      student_a = Student.new(24, nil, 'Samuel')
      student_b = Student.new(23, nil, 'Christian')
      classroom.add_students(student_a)
      classroom.add_students(student_b)
      expect(classroom.students).to include student_a
      expect(classroom.students.length).to eq 2
    end
  end
end
