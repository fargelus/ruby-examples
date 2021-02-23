# frozen_string_literal: true

class Dog end

rover = Dog.new
puts 'Rover is a Dog' if rover.is_a? Dog

puts 'Rover is some kind of Dog' if rover.is_a? Dog
