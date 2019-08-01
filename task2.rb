def second students
    length = students.length
    students_sorted = students.sort_by {|key, value| 
        value
    }

    students_it = students_sorted.slice!(length-3..length-1).reverse
    students_em = students_sorted.delete_if {|student|
        student[1] < 60
    }

    if students_em.length > 3 
        students_em.reverse!
        students_em.slice!(3..-1)
    end

    puts '- - - - - - - - - - -'
    puts 'IT - students:'
    3.times {|i|
        puts " - #{students_it[i][0]} > #{students_it[i][1]} score"
    }
    puts '- - - - - - - - - - -'
    puts 'EM - students:'
    3.times {|i|
        puts " - #{students_em[i][0]} > #{students_em[i][1]} score"
    }
    puts '- - - - - - - - - - -'
end

second({
    "Pavel" => 99,
    "Nikita" => 55,
    "Zhanna" => 75,
    "Jana" => 86,
    "Petr" => 61,
    "Vladimir" => 74,
    "Vlad" => 32,
    "Vimir" => 64,
    "Mir" => 94
})
   