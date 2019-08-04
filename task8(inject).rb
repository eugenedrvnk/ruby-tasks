def count
    big_num = ARGV[0].to_i
    (1..big_num/2).each do |i|
        sub_count(big_num, i)
    end
end

def sub_count(big_num, start_val)
    (start_val+1..big_num-1).inject(start_val) do |res, val|
        print_loop(start_val, val-1, big_num) if res == big_num
        return res, val-1 if res >= big_num
        res += val
    end
end

def print_loop(from, to, big_num)
    from.upto(to) do |num|
        print "#{num} + " if num != to
        print "#{num} = #{big_num}\n" if num == to
    end
end

count
