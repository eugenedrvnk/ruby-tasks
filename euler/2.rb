def fibo_even
    limit = 4000000
    res_sum = 2

    (2..100).inject([2,3]) do |arr|
        new_last = [arr[-1]+arr[-2]]
        res_sum += new_last[0] if new_last[0].even?
        return res_sum if new_last[0] > limit
        arr += new_last
    end
end

p fibo_even

