require_relative '../classroom'
require_relative '../book'
require_relative '../person'

describe Rental do
  context 'Tracking rentals' do
    it 'Create rentals' do
      book_one = Book.new('Inbox Blueprint', 'Anik Singal')
      book_two = Book.new('Way of the Wolf', 'Jordan Belfort')
      person_one = Person.new(32, 'Sean')
      person_two = Person.new(28, 'Mabel')
      rental_one = Rental.new('2020-12-12', book_one, person_two)
      rental_two = Rental.new('11/5/2119', book_one, person_one)
      rental_three = Rental.new('2/27/2037', book_two, person_one)
      expect(person_one.rentals.length).to eq 2
      expect(book_one.rentals.length).to eq 2
      expect(person_two.rentals).to include rental_one
      expect(person_one.rentals).to include rental_two && rental_three
    end
  end
end
