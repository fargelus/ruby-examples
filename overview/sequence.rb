# frozen_string_literal: true

def my_sequence
  (1..10).each do |i|
    yield i
  end
end

my_sequence { |x| puts x**3 }
