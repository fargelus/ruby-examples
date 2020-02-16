module Enumerable
  def conmap(&block)
    threads = []
    self.each do |item|
      threads << Thread.new { block.call(item) }
    end
    threads.map &:value
  end

  def concurrently
    map { |i| Thread.new { yield i } }.each &:join
  end
end

puts [1, 2, 3].conmap { |v| v ** 2 }
puts [1, 2, 3].concurrently { |v| v ** 2 }
