require "Prime"

def primes_sum limit
  num = 2
  sum = 0
  while num < limit
    if Prime.prime?(num)
      sum += num
    end
    num += 1
  end
  puts sum
end

primes_sum 20