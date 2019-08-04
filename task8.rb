x = 2005

(1..x-1).each do |i|
    j = i
    plus_elem = i+1
    last_value = 0

    while j < x
        j += plus_elem
        plus_elem += 1
    end

    if j == x
        print "#{i} || #{plus_elem-1}\n"
    end
end