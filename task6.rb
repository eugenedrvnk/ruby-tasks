#x,y = width & height of field
#pos_x, pos_y = position of robot
#current_direction = DOWN / UP / LEFT / RIGHT
#display_field = draw field boolean
#placed = ball was placed or no? boolean


def draw(x, y, pos_x, pos_y, current_direction, display_field, placed)
    pos_x = pos_x.to_i
    pos_y = pos_y.to_i

    #### draw field ####

    if display_field
    (0..y+1).each {|i|
        subStr = ''
        (0..x+1).each {|j|
            if (i == pos_y && j == pos_x)
                subStr += 'X'
            elsif
                (i == 0 || j == 0 || i == y+1 || j == x+1)
                subStr += '#'
            else
                subStr += ' '
            end
        }
        puts subStr
    }
    end

    #### ######### ####

    #### validFunc ####

    def checkMoveValidity(x, y, new_pos_x, new_pos_y, cd, placed)
        case cd
        when 'UP'
            new_pos_y -= 1
        when 'DOWN'
            new_pos_y +=1
        when 'LEFT'
            new_pos_x -= 1
        when 'RIGHT'
            new_pos_x += 1
        end

        if (new_pos_x < 0 || new_pos_y < 0 || new_pos_x > x || new_pos_y > y)
            {
                :bool => false
            }
        else
            {
                :bool => true,
                :x => new_pos_x,
                :y => new_pos_y,
            }
        end
    end

    def checkPlaceValidity(x, y, new_pos_x, new_pos_y)
        if (new_pos_x <= 0 || new_pos_y <= 0 || new_pos_x > x || new_pos_y > y)
            false
        else 
            true
        end
    end

    #### ######### ####

    commands = ['REPORT', 'UP', 'DOWN', 'LEFT', 'RIGHT', 'MOVE']

    input = gets.chomp

    if (input[0..4] != 'PLACE') && (commands.include? input) && !placed
        puts 'Please, set robot\'s position before other commands!'
        draw(x, y, pos_x, pos_y, current_direction, false, false)
    end

    if input[0..4] == 'PLACE'
        indexes = input.split(' ')
        indexes.shift
        if checkPlaceValidity(x, y, indexes[0].to_i, indexes[1].to_i)
            draw(x, y, indexes[0], indexes[1], current_direction, true, true)
        else
            puts 'Please, set correct posiiton of robot:'
            puts "Column from 1 to #{x} || Row from 1 to #{y}"
            draw(x, y, pos_x, pos_y, current_direction, false, false)
        end
    elsif input == 'LEFT'
        if current_direction == 'DOWN'
            current_direction = 'RIGHT'
        elsif 
            current_direction == 'RIGHT'
            current_direction = 'UP'
        elsif 
            current_direction == 'UP'
            current_direction = 'LEFT'
        elsif
            current_direction == 'LEFT'
            current_direction = 'DOWN'
        end
        draw(x, y, pos_x, pos_y, current_direction, false, true)
    elsif input == 'RIGHT'
        if current_direction == 'DOWN'
            current_direction = 'LEFT'
        elsif
            current_direction == 'LEFT'
            current_direction = 'UP'
        elsif
            current_direction == 'UP'
            current_direction = 'RIGHT'
        elsif
            current_direction == 'RIGHT'
            current_direction = 'DOWN'
        end
        draw(x, y, pos_x, pos_y, current_direction, false, true)
    elsif  input == 'MOVE'
        move_info = checkMoveValidity(x, y, pos_x, pos_y, current_direction, placed)
        if move_info[:bool]
            draw(x, y, move_info[:x], move_info[:y], current_direction, true, true)
        else
            puts 'It\'s dangerous move! Try some other direction!'
            draw(x, y, pos_x, pos_y, current_direction, false, placed)
        end
    elsif
        input == 'REPORT'
        puts "Robot's location: x = #{pos_x} | y = #{pos_y}"
        draw(x, y, pos_x, pos_y, current_direction, false, true)
    else 
        puts "Enter correct command, please!(e.g > PLACE x y | LEFT | RIGHT | MOVE | REPORT"
        draw(x, y, pos_x, pos_y, current_direction, false, placed)
    end
end

draw(10, 6, -1,-1, 'DOWN', true, false)