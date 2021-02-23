# frozen_string_literal: true

class Friend
  attr_accessor :name

  @@common = 'Andrew'

  def initialize(name, phone)
    @name = name
    @phone = phone
  end

  def hello
    puts "Hello, my name is #{@name} and my tel is #{@phone}"
  end

  def self.our_common_friend
    puts "Our commom friend is #{@@common}"
  end
end

susan = Friend.new('Susan', '+7081231')
john = Friend.new('John', '+790124151')

puts susan.name

susan.hello
john.hello
Friend.our_common_friend
