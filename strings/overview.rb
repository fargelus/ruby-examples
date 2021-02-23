# frozen_string_literal: true

str = 'hello'
str << ' world!'
puts str

str.insert(5, ' there')
puts str

str.slice!(5, 6)
puts str

puts "Size: #{str.size}"
puts str.index('l')
puts

puts str.start_with? 'hell'
puts str.end_with? 'orld'
puts str.include? 'wor'
puts str =~ /[aeiou]{2}/
puts str.match(/[aeiou]/, &:to_s)
p str.split
puts

p 'banana'.partition('an')
p 'banana'.rpartition('an')
puts

puts str.sub('l', 'L')
puts str.gsub!('l', 'L')
puts str.swapcase
puts str.capitalize
puts

s = "\t    some   \n"
puts s
puts s.strip
puts s.lstrip
puts s.rstrip
puts

s = 'x'
puts s.center(3)
puts s.center(5, '-')
puts s.center(7, '-=')
puts

s = 'asdf'
p s.chars
puts '10'.to_i(2)
puts 'a'.succ
'a'.upto('e') { |c| print c }
puts

puts 'hello'.squeeze('a-z')
puts 'hello'.count('l')
puts 'hello'.delete('l')
puts

puts format("%s: in '%s' line %d", 'Syntax error', 'test.rb', 20)
