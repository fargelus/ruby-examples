def sum(a, b, *c)
  summa = a + b
  c.each do |x|
    summa += x
  end

  summa
end

puts sum(1, 2)
puts sum(1, 2, 5, 6, 7, 10)
