def five(length, range_limit)
    array = []
    length.times {
        array.push(rand(0..range_limit))
    }

    print "Default array: #{array}\n"

    hash = {}
    array.each { |number|
        hash[number] = ''
    }
    puts "U have #{hash.length} different number"
    print "Here they are: "
    hash.each_key {|key|
        print " #{key} ||"
    }
    print "\n"
end

five(10,10)