require_relative '../book'
require_relative '../rental'
require_relative '../student'

describe Book do
  context 'create an instance and add rentals for the book' do
    it 'should create an instance of a book' do
      book = Book.new('Unlock It', 'Dan Lok')
      expect(book).to be_a Book
    end

    it 'should add a book to rentals' do
      new_book = Book.new('Unlock It', 'Dan Lok')
      person = Student.new(22, nil, 'Lebron')
      rent_book = new_book.add_rentals(person, '28/06/2023')
      expect(rent_book).to be_a Rental
    end
  end
end
