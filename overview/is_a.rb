class Dog end

rover = Dog.new
if rover.is_a? Dog
  puts 'Rover is a Dog'
end

if rover.kind_of? Dog
  puts 'Rover is some kind of Dog'
end
