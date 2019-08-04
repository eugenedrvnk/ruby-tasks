def second students

    students_sorted = students.sort do |a,b|
        b[1] - a[1]
    end

    students_it = students_sorted[0..2]
    students_em = students_sorted[3..5].select {|item| item[1] > 60}

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