def largest_prime_factor num
    num.to_f 
    factors = []
    (num/2).downto(2) do |i|
        temp = num/i.to_f
        if temp % 1 == 0 && lower_factors(temp, factors) == false
            factors << temp.to_i
        end
    end
    p factors.max
end

def lower_factors(a, factors)
    factors.each do |item|
        if (a/item) % 1 == 0
          return true  
        end
    end
    return false
end

largest_prime_factor 600851475143
