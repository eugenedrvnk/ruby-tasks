
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

    print array.to_s + "\n"

    (min+difFrom..min+difTo).each {|number|
        hash[number-min] = coincidenceAmount(array, number)
    }

    puts hash
end

seven(20, 5, 10)