require_relative '../student'
require_relative '../classroom'

describe Student do
  context 'Testing student interactions' do
    it 'should create an instance of student' do
      student = Student.new(25, nil, 'Lawrence')
      expect(student).to be_a Student
    end

    it 'should register a student to a classroom' do
      student = Student.new(25, nil, 'Lawrence')
      classroom = Classroom.new('Anthropology')
      classroom.add_students(student)
      expect(classroom).to be_a Classroom
      expect(classroom.students).to include student
    end

    it 'should play hooky' do
      student = Student.new(25, nil, 'Lawrence')
      play = student.play_hooky
      expect(play).to eq '¯\(ツ)/¯'
    end
  end
end