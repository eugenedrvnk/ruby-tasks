require 'Prime'

def largest_prime_factor num
    num.to_f 
    factors = []
    (num/2).downto(2) do |i|
        temp = num/i.to_f
        if temp % 1 == 0 && Prime.prime?(temp.to_i)
            factors << temp.to_i
        end
    end
    p factors.max
end

largest_prime_factor 6000000