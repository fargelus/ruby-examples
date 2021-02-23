# frozen_string_literal: true

class Roman
  include Comparable

  I = 1
  IV = 4
  V = 5
  IX = 9
  X = 10
  XL = 40
  L = 50
  XC = 90
  C = 100
  CD = 400
  D = 500
  CM = 900
  M = 1000

  Values = %w[M CM D CD C C XC L XL X IX V IV I].freeze

  def self.encode(value)
    return '' if value == 0

    Values.each do |letters|
      rnum = const_get(letters)
      return letters + '' + encode(value - rnum) if value >= rnum
    end
  end

  def self.decode(rvalue)
    sum = 0
    letters = rvalue.split('')
    letters.each_with_index do |letter, i|
      this = const_get(letter)
      that = begin
               const_get(letters[i + 1])
             rescue StandardError
               0
             end
      op = that > this ? :- : :+
      sum = sum.send(op, this)
    end

    sum
  end

  def initialize(value)
    case value
    when Numeric
      @decimal = value
      @roman = Roman.encode(@decimal)
    when String
      @roman = value
      @decimal = Roman.decode(value)
    end
  end

  def to_s
    @roman
  end

  def to_i
    @decimal
  end

  def <=>(other)
    to_i <=> other.to_i
  end
end

def Roman(val)
  Roman.new(val)
end

puts Roman(10)
puts Roman('IV').to_i
