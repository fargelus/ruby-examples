class Array
  def qsort
    return dup if size <= 1

    l, r = partition { |x| x <= self.first }
    c, l = l.partition  { |x| x == self.first }
    l.qsort + c + r.qsort
  end

  def qsort!
    replace(qsort)
  end
end

a = [1,7,6,5,4,3,2,1]
p a.qsort
p a
a.qsort!
p a
