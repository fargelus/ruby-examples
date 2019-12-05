module Quantifier
  def two?
    2 == self.select { |x| yield x }.size
  end

  def four?
    4 == self.select { |x| yield x }.size
  end
end

list = (1..5).to_a
list.extend(Quantifier)

puts list.two? {|x| x > 3}
puts list.two? {|x| x >= 3}
puts list.four? {|x| x > 1}
