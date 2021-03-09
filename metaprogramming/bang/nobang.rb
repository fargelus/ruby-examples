# frozen_string_literal: true

class Module
  def make_nobang(*methods)
    methods.each do |method|
      define_method(method.to_s) do |*args, &block|
        dup.send("#{method}!", *args, &block)
      end
    end
  end
end

class String
  def down!
    downcase!
  end

  make_nobang :down
end

a = 'AabCew'
b = 'AabCew'
puts 'a downcased: ' + a.down!
puts 'a: ' + a
puts 'b: ' + b
puts 'b downcased: ' + b.down
puts 'b: ' + b
