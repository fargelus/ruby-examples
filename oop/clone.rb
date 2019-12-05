s1 = 'cat'

def s1.upcase
  'CaT'
end

s1_dup = s1.dup       # Only object content 'cat'
s1_clone = s1.clone   # object content + singlet methods
puts s1       # cat
puts s1_dup.upcase      # CAT singlet method not duping
puts s1_clone.upcase    # CaT
