#x,y = width & height of field

def draw(x,y, pos_x, pos_y, current_direction)
    pos_x = pos_x.to_i
    pos_y = pos_y.to_i

    (0..x).each {|i|
        subStr = ''
        (0..y).each {|j|
            if (i == pos_y && j == pos_x)
                subStr += 'X'
            else
                subStr += '*'
            end
        }
        puts subStr
    }

    #### validFunc ####

    def checkMoveValidity(x, y, new_pos_x, new_pos_y, cd)
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

        if (new_pos_x < 0 || new_pos_y < 0 || new_pos_x-1 > x || new_pos_y-1 > y)
            {
                :bool => false
            }
        else
            {
                :bool => true,
                :x => new_pos_x,
                :y => new_pos_y
            }
        end
    end

    #### ######### ####
    
    type = gets.chomp
    
    if type[0..4] == 'PLACE'
        indexes = type[-3..-1].split(' ')
        draw(x, y, indexes[0], indexes[1], current_direction)
    elsif
        type == 'LEFT'
        current_direction = 'LEFT'
        draw(x, y, pos_x, pos_y, current_direction)
    elsif
        type == 'RIGHT'
        current_direction = 'RIGHT'
        draw(x, y, pos_x, pos_y, current_direction)
    elsif
        type == 'DOWN'
        current_direction = 'DOWN'
        draw(x, y, pos_x, pos_y, current_direction)
    elsif
        type == 'UP'
        current_direction = 'UP'
        draw(x, y, pos_x, pos_y, current_direction)
    elsif
        type == 'MOVE'
        move_info = checkMoveValidity(x, y, pos_x, pos_y, current_direction)
        if move_info[:bool]
            draw(x, y, move_info[:x], move_info[:y], current_direction)
        else
            puts 'It\'s dangerous move! Try some other direction!'
            draw(x, y, pos_x, pos_y, current_direction)
        end
    elsif
        type == 'REPORT'
        puts "Robot's location: x = #{pos_x} | y = #{pos_y}"
        draw(x, y, pos_x, pos_y, current_direction)
    end
end

draw(5,6,-1,-1, 'DOWN')