def print_even_odd
    array = [1,2,3,4,5,6,7]
    substr_even = substr_odd = ''
    array.each.with_index do |value, index|
        index.even? ? substr_even += value.to_s + '||' : substr_odd += value.to_s + '||'
    end
    print "#{substr_even} >> << #{substr_odd}"
end

print print_even_odd