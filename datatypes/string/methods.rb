# frozen_string_literal: true

print 'Chars: '
str = 'ABC'
str.each_char { |char| print char, ' ' }
puts

print 'Bytes: '
str.each_byte { |byte| print byte, ' ' }
puts

puts '***** Matching *****'
str = "I'm a leaf on the wind"
str.scan(/[a-z]+/i).each { |x| print x, ' ' }
puts
