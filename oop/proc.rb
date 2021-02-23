# frozen_string_literal: true

def take_block(x, &block)
  puts block.class
  x.times { |i| block[i, i * i] }
end

take_block(3) { |n, s| puts "#{n} squares eq #{s}" }
