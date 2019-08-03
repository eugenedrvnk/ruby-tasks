def palindrome
  results = []
  999.downto(100) do |i|
    999.downto(100) do |j|
      res = (i*j).to_s
      results << res.to_i if res==res.reverse
    end
  end
  return results.max
end

p palindrome