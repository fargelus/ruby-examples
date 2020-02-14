require 'open-uri'

URL = 'https://www.google.com/webhp?hl=ru&sa=X&ved=0ahUKEwj-m9yrzNDnAhW6AhAIHc9xDQcQPAgH'
open(URL) do |page|
  puts page.read
end
