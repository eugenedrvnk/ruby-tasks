def difference
  puts (1..100).inject(:+)**2-(1..100).inject{|sum,val|sum+=val**2}
end

difference