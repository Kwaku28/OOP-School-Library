require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe Person do
  context 'Create instance of person and test against methods' do
    it 'should create an instance of person' do
      person = Person.new(25, 'Lawrence Amoafo')
      expect(person).to be_a Person
    end

    it 'test the correct name method' do
      person = Person.new(25, 'Lawrence Amoafo')
      correct_name = person.correct_name
      expect(correct_name).to eq 'Lawrence Amoafo'
    end

    it 'test the can use services' do
      person = Person.new(17, 'Lawrence Amoafo')
      use_service = person.can_use_services?
      expect(use_service).to eq true
    end

    it 'test the add rental method' do
      person = Person.new(27, 'Lawrence Amoafo')
      book = Book.new('Millonaire Fastlane', 'M. J. Demarco')
      rent = Rental.new('24/06/2023', book, person)
      expect(person.rentals).to include rent
    end
  end
end
