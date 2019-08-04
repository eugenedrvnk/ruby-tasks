x = 1000

1.upto(x) do |i|
    (i+1).upto(x) do |j|
        sum = i**2+j**2
        sum_sqrt = Math.sqrt(sum)
        if sum_sqrt%1 == 0 && i+j+sum_sqrt == 1000 
            p [i,j,sum_sqrt]
            p i*j*sum_sqrt.to_i
        end      
    end
end
