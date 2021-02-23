# frozen_string_literal: true

str = 'hello'

class << str
  def hyphen
    split('').join('-')
  end
end

puts str.hyphen
