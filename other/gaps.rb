require 'prime'

def gap(g, m, n)
  (m...n-1).each do |first|
    next unless Prime.prime?(first)

    dist = 0
    (first+1...n).each do |second|
      next (dist += 1) unless Prime.prime?(second)

      return [first, second] if g - dist == 1
      break if g - dist > 1
    end
  end

  nil
end
