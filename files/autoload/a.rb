autoload(:C, './c.rb')

module A
  autoload(:B, './b.rb')

  p autoload? :B
  B
  p autoload? :B

  # Всегда nil
  p 'autoload? :C - ' + autoload?(:C).to_s

  p 'constants: ' + constants.join(' ')
end

puts
puts '---outside---'
p autoload? :C
