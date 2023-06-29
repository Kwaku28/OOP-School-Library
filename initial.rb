def menu(app)
  app.options
  print 'input: '
  gets.chomp.to_i
end

def intro
  puts '=============================='
  puts 'Welcome to School Library App!'
  puts '=============================='
end

def manage_selection(app, option)
  tasks = {
    1 => :list_books,
    2 => :list_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rental,
    7 => :exit_app,
    default: :invalid_option
  }

  selection = tasks[option] || tasks[:default]
  app.send(selection)
end

def initial(app)
  intro
  loop do
    option = menu(app)
    manage_selection(app, option)
    puts "\n"
  end
end
