def lowest_power_of_two_greater_than(n)
  (0..).each { |x| return x if 2 ** x > n }
end

puts lowest_power_of_two_greater_than(10)
puts lowest_power_of_two_greater_than(100)
