n = 0
thrs = []
while n < 3
  thrs << Thread.new(n) { |n| puts n }
  n += 1
end

thrs.each &:join
