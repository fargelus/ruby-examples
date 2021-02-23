# frozen_string_literal: true

some_var = 1
if defined? some_var
  puts "some_var = #{some_var}"
else
  puts "#{some_var} not exist"
end
