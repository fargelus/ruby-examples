# frozen_string_literal: true

require 'forwardable'

class MyQueue
  extend Forwardable

  def initialize(obj = [])
    @queue = obj
  end

  def_delegator :@queue, :push, :enqueue
  def_delegator :@queue, :shift, :dequeue
end

mq = MyQueue.new

mq.enqueue(123)
mq.enqueue(234)

p mq.dequeue
p mq.dequeue
