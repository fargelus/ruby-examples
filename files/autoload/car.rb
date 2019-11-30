module Car
  autoload(:Engine, './engine.rb')

  puts 'The :Engine module isn\'t yet loaded'
  Engine
  puts 'The :Engine module successfully loaded'
end
