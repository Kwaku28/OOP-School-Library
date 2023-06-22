require_relative 'person'
require_relative 'decorator'
require_relative 'trimmer'
require_relative 'capitalize'

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalize_person = CapitalizeDecorator.new(person)
puts capitalize_person.correct_name
capitalize_trim_person = TrimmerDecorator.new(capitalize_person)
puts capitalize_trim_person.correct_name
