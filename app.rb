require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'preserve_data'

class App
  def initialize
    @books = read_file('data/books.json')
    @people = read_file('data/people.json')
    @rentals = read_file('data/rentals.json')
  end

  def list_books
    @books = read_file('data/books.json')
    puts 'No book yet!' if @books.empty?
    @books.each { |book| puts "[#{book['_class']}] Title: #{book['title']} | Author: #{book['author']}" }
  end

  def list_people
    @people = read_file('data/people.json')
    puts 'We do not have people yet!' if @people.empty?
    @people.each do |person|
      puts "[#{person['_class']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
  end

  def list_rental
    @rentals = read_file('data/rentals.json')
    if @rentals.empty?
      puts 'No recent rentals!'
      return
    end
    list_people
    print 'Enter the Person ID: '
    person_id = gets.chomp.to_i
    @rentals.each do |rent|
      if rent['person']['id'] == person_id
        puts "Date: #{rent['date']}, Book: #{rent['book']['title']} | Author: #{rent['book']['author']}"
      end
    end
  end

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
      write_file(@people, 'data/people.json')
    when 'n'
      student = Student.new(age, nil, name, parent_permission: false)
      @people << student
      write_file(@people, 'data/people.json')
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
    write_file(@people, 'data/people.json')
    puts 'You have successfully registered a Teacher'
  end

  def create_person
    print 'Do you want to create a new student (1) or teacher (2)? [Input the number]: '
    type_of_person = gets.chomp.to_i
    case type_of_person
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'You have entered an invalid option'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    write_file(@books, 'data/books.json')
    puts 'Book was created successfully'
  end

  def select_book
    @books = read_file('data/books.json')
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book['title']} | Author: #{book['author']}" }
  end

  def select_person
    @people = read_file('data/people.json')
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person['name']}, Id: #{person['id']}, Age: #{person['age']}"
    end
  end

  def create_rental
    if @books.empty? || @people.empty?
      puts 'There are no books or people to create a rental'
      return
    end

    select_book
    selected_book = gets.chomp.to_i

    select_person
    selected_person = gets.chomp.to_i

    puts 'Date: '
    selected_date = gets.chomp.to_s

    rented = Rental.new(selected_date, @books[selected_book], @people[selected_person])
    @rentals << rented
    write_file(@rentals, 'data/rentals.json')

    puts 'Book was successfully rented'
  end

  def invalid_option
    puts 'Invalid option'
  end

  def exit_app
    puts '============================='
    puts 'Thank you for using this app!'
    puts '============================='
    exit
  end

  def options
    puts 'Please enter the number for the task you want to perform'
    puts 'choose one of the following'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end
end
