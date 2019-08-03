require 'Prime'

def index_prime x
  index = 1
  number = 2
  while index != x
    number += 1
    if Prime.prime?(number)
      index += 1
    end
  end
  number
end

puts index_prime 10001