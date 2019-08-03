def smallest_multiple(from, to)
  current_num = to
  until check_remainder(from, to, current_num)
    current_num += to
  end
  current_num
end

def check_remainder(from, to, current_num)
  from.upto(to) do |x|
    return false if current_num%x !=0
  end
  true
end 

puts smallest_multiple(1,20)
