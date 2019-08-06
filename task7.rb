
def seven(length, difFrom, difTo)
    array = []
    hash = {}
    min = 0


    def coincidenceAmount(array, number)
        subHash = {}
        array.each_with_index {|item, index|
            if item == number
                subHash[index] = number
            end 
        }
        subHash
    end

    length.times {
        array.push(rand(0...30))
    }

    min = array.min

    puts "\n min digit = #{min}\n\n"

    print array.to_s + "\n"

    (min+difFrom..min+difTo).each {|number|
        subHash = coincidenceAmount(array, number)
        if subHash.length != 0
            hash[number-min] = subHash        
        end
    }

    puts hash
end

seven(20, 5, 10)