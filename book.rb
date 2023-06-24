class Book
  attr_accessor :title, :author, :rentals, :rented #added rented here

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @rented = false #This attribute was added after we used pry to debug the code
  end

  def add_rentals(person, date)
    Rental.new(date, self, person)
  end
end
