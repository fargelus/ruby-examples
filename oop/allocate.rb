# frozen_string_literal: true

class Person
  attr_accessor :name, :age, :phone

  def initialize(n, a, p)
    @name = n
    @age = a
    @phone = p
  end
end

p1 = Person.new('John Smith', 29, '555-1-22')
p2 = Person.allocate

puts p1.name    # John Smith
puts p2.name    # nil
