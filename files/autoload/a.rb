# frozen_string_literal: true

autoload(:C, './c.rb')

module A
  autoload(:B, './b.rb')

  p autoload? :B
  B
  p autoload? :B

  # Always nil
  p 'autoload? :C - ' + autoload?(:C).to_s

  # :B
  p 'constants: ' + constants.join(' ')
end

puts
puts '---outside---'
p autoload? :C
