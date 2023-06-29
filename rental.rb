class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    @book.rentals.push(self) if @book.is_a?(Book)
    @person.rentals.push(self) if @person.is_a?(Person)
  end

  def to_h
    {
      _class: self.class.name,
      object_id: object_id,
      date: @date,
      book: @book,
      person: @person
    }
  end
end
