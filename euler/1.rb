def find_multiples
    num = ARGV[0].to_i

    0.upto(num).inject do |res, val|
        res += val if val%3 == 0 || val%5 == 0
        res
    end
end

puts find_multiples

