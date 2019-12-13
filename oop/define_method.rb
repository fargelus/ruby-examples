class MyClass
  define_method(:body_method) { puts 'Class body' }

  def self.new_method(name, &block)
    define_method(name, &block)
  end
end

MyClass.new_method(:class_method) { puts 'Class method' }

x = MyClass.new
x.body_method
x.class_method
