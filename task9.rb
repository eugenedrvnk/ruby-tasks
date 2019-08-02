def get_max_count x
    x.to_s.scan(/#{x.to_s.split('').max}/).join.length
end

puts get_max_count 77777
puts get_max_count 12321