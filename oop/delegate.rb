# frozen_string_literal: true

require 'delegate'

class MyQueue < DelegateClass(Array)
  def initialize(arg = [])
    super(arg)
  end

  alias enqueue push
  alias dequeue shift
end

mq = MyQueue.new

mq.enqueue(123)
mq.enqueue(234)

p mq.dequeue
p mq.dequeue
