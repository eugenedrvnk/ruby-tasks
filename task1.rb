def first(length, range_limit)
    unless (length.is_a? Integer) || (length.is_a? Integer)
        puts 'Please, puts integer values'
        return 
    end

    
    array_a = []
    array_b = []

    sum = 0

    length.times { |i|
        digit = rand(0...range_limit)
        array_a.push(digit)
        sum += digit
        array_b[i] = sum  
    }

    print 'Array A = ' + array_a.to_s + "\n"
    print 'Array B = ' + array_b.to_s + "\n"
end

first(10,100)




