counter = 0

1901.upto(2000) do |year|
    1.upto(12) do |month|
        counter += 1 if Time.new(year,month).wday == 0
    end
end

p counter