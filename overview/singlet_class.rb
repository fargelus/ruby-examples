str = 'hello'

class << str
  def hyphen
    self.split('').join('-')
  end
end

puts str.hyphen
