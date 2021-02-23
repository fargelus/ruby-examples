# frozen_string_literal: true

class Person
  attr_reader :name, :age, :height

  def initialize(name, age, height)
    @name = name
    @age = age
    @height = height
  end

  def inspect
    "#{@name} #{@age} #{@height}"
  end
end

class Array
  def map_by(sym)
    map { |x| x.send(sym) }
  end
end

people = []
people << Person.new('Hansel', 35, 69)
people << Person.new('Gretel', 32, 64)
people << Person.new('Ted', 36, 68)
people << Person.new('Alice', 33, 63)

p1 = people.map_by(:name)
p2 = people.map_by(:age)
p3 = people.map_by(:height)

print p1
puts
print p2
puts
print p3
puts
