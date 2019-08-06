require './table'

class Robot
    def initialize
        @rows_count = 3
        @columns_count = 5
        @table = Table.new({rows_count: @rows_count, columns_count: @columns_count}).generate_table
        @direction = 'UP'
        @x = ''
        @y = ''
        @robot_is_placed = false
        print_table
        input_command
    end

    def input_command
        command = gets.chomp
        validate_input command
    end
    
    def place_robot(x, y)
        @x = x
        @y = y
        p @robot_is_placed
        @robot_is_placed = true
        p @robot_is_placed
    end

    def generate_table(rows_count, columns_count)
        @rows_count = rows_count
        @columns_count = columns_count
        @x = ''
        @y = ''
        @table = Table.new({rows_count: @rows_count, columns_count: @columns_count}).generate_table
    end

    def turn turn_side
        directions_hash = {
            left: {
                down: 'right',
                right: 'up',
                up: 'left',
                left: 'down'
            },
            right: {
                down: 'left',
                left: 'up',
                up: 'right',
                right: 'down'
            }
        }
        @direction = directions_hash[turn_side.downcase.to_sym][@direction.downcase.to_sym].upcase
        # case turn_side
        # when 'LEFT'
        #     if @direction    == 'DOWN'
        #         @direction   = 'RIGHT'
        #     elsif @direction == 'RIGHT'
        #         @direction   = 'UP'
        #     elsif @direction == 'UP'
        #         @direction   = 'LEFT'
        #     elsif @direction == 'LEFT'
        #         @direction   = 'DOWN'
        #     end
        # when 'RIGHT'
        #     if @direction    == 'DOWN'
        #         @direction   = 'LEFT'
        #     elsif @direction == 'LEFT'
        #         @direction   = 'UP'
        #     elsif @direction == 'UP'
        #         @direction   = 'RIGHT'
        #     elsif @direction == 'RIGHT'
        #         @direction   = 'DOWN'
        #     end
        # end
    end

    def move
        case @direction
        when 'UP'
            @x -= 1
        when 'DOWN'
            @x += 1
        when 'LEFT'
            @y -= 1
        when 'RIGHT'
            @y += 1
        end
    end

    def display_robot_position
        p "В данный момент робот находится на #{@x} строке, в #{@y} столбике."
    end

    def print_table
        0.upto(@table.length-1) do |i|
            0.upto(@table[i].length-1) do |j|
                if i == @x && j == @y
                    print 'X'
                else
                    print @table[i][j]
                end
            end
            puts
        end
    end

    def validate_input command
        command = command.split(' ')
        command = command.map.with_index {|str,index|index == 0 ? str : str.to_i}
        if command[0] == 'GENERATE'
            if command[1].nil? || command[2].nil? || command[1] < 1 || command[2] < 1
                p "Для построения таблицы напишите команду по форме GENERATE X Y (x > 0, y > 0)"
            else 
                generate_table(command[1], command[2])
                print_table
            end
        elsif command[0] != 'PLACE' && !@robot_is_placed 
            puts 'Расположите робота перед использованием других команд! (PLACE X Y)'
            puts 'Если вы хотите перестроить поле - используйте команду GENERATE (GENERATE X Y)'
        elsif command[0] == 'PLACE'
            if command[1].nil? || command[2].nil?
                p 'Используйте PLACE в следующей форме - PLACE X Y'
            elsif command[1] < 1 || command[1] > @rows_count || command[2] < 1 || command[2] > @columns_count
                p "Указывайте корректные значения для робота (x от 1 до #{@rows_count} | y от 1 до #{@columns_count}"
            else
                place_robot(command[1],command[2])
                @robot_is_placed = true
                print_table
            end
        elsif command[0] == 'LEFT'
            turn 'LEFT'
            print_table
        elsif command[0] == 'RIGHT'
            turn 'RIGHT'
            print_table
        elsif command[0] == 'REPORT'
            display_robot_position
        elsif command[0] == 'MOVE'
            if @direction == 'UP'
                if @x-1 < 1
                    p "Ваш ход для робота опасен, попробуйте его повернуть! (LEFT / RIGHT)"
                else move
                end
            end
            if @direction == 'DOWN'
                if @x+1 > @rows_count 
                    p "Ваш ход для робота опасен, попробуйте его повернуть! (LEFT / RIGHT)"
                else move
                end
            end
            if @direction == 'LEFT'
                if @y-1 < 1
                    p "Ваш ход для робота опасен, попробуйте его повернуть! (LEFT / RIGHT)"
                else move
                end
            end
            if @direction == 'RIGHT'
                if @y+1 > @columns_count
                    p "Ваш ход для робота опасен, попробуйте его повернуть! (LEFT / RIGHT)"
                else move
                end
            end
            print_table
        else print "Введите корректную команду.\nДоступные команды : PLACE, MOVE, LEFT, RIGHT, REPORT, GENERATE\n"
        end
        input_command
    end
end
  
robot = Robot.new
