# frozen_string_literal: true

module Quantifier
  def two?
    self.select { |x| yield x }.size == 2
  end

  def four?
    self.select { |x| yield x }.size == 4
  end
end

list = (1..5).to_a
list.extend(Quantifier)

puts list.two? { |x| x > 3 }
puts list.two? { |x| x >= 3 }
puts list.four? { |x| x > 1 }
