def create_student
  print 'Age: '
  age = gets.chomp.to_i
  print 'Name: '
  name = gets.chomp
  print 'Has parent permission? [Y/N]: '
  permission = gets.chomp.downcase

  case permission
  when 'y'
    student = Student.new(age, nil, name, parent_permission: true)
    @people << student
  when 'n'
    student = Student.new(age, nil, name, parent_permission: false)
    @people << student
  else
    'You have entered an invalid option'
  end

  puts 'You have successfully registered a Student'
end

def create_teacher
  print "Teacher's name: "
  name = gets.chomp
  print "Teacher's age: "
  age = gets.chomp.to_i
  print "Teacher's specialization: "
  specialization = gets.chomp
  teacher = Teacher.new(age, specialization, name, parent_permission: true)
  @people << teacher
  puts 'You have successfully registered a Teacher'
end
  