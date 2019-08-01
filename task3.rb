vocabulary = [
    {
        :en => 'horse',
        :ru => ['loshad', 'zherebec', 'skakun'],
    },
    {
        :en => 'dog',
        :ru => ['sobachka', 'sobaka', 'bobik', 'tuzik', 'pes'],
    }
]

def third vocabulary
    words_count = vocabulary.length
    puts words_count
    answers = {
        :correct => {
            :count => 0,
            :id => []
        },
        :incorrect => {
            :count => 0,
            :id => []
        }
    }

    puts 'GET READY, BRO'
    puts 'READY? PRESS ENTER'
    gets 

    words_count.times {|i|
        word_info = vocabulary[i]
        puts "Translate word #{word_info[:en]}"
        input_word = gets.chomp
        if word_info[:ru].include?(input_word)
            answers[:correct][:count] += 1
            answers[:correct][:id].push(i)
            puts "Keep it up! Already #{answers[:correct][:count]} correct answers!"
            puts "That's some other translations for #{word_info[:en]}"
            (0..word_info[:ru].length-1).each {|i|
                word = word_info[:ru][i]
                next if word == input_word
                puts "- #{word}"
            }
        else
            puts 'Sorry, but ur answer is wrong...'
            puts 'Here are the possible translations of the word :'
            (0..word_info[:ru].length-1).each {|i|
                word = word_info[:ru][i]
                next if word == input_word
                puts "- #{word}"
            }
            answers[:incorrect][:count] += 1
            answers[:incorrect][:id].push(i)
        end
    }
    puts "Correct answers: #{answers[:correct][:count]}/#{words_count} (#{(answers[:correct][:count]/words_count.to_f)*100}%)"
    puts "Unknowable words:" if answers[:incorrect][:count] > 0
    answers[:incorrect][:id].each {|id|
        puts " - #{vocabulary[id][:en]}"
    }
end

third vocabulary