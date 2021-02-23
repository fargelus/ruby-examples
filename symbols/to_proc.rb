# frozen_string_literal: true

class Symbol
  def to_proc
    proc { |x, *args| x.send(self, *args) }
  end
end

print [1, 2, 3].map &:to_s
puts
print [1, 2, 3].inject &:+
puts
