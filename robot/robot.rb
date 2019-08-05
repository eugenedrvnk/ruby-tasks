require './table'

class Robot
    def initialize
        @table = Table.new({rows_count: 3, columns_count: 5}).generate_table
        @direction = 'DOWN'
        @x = 2
        @y = 3
        @robot_is_placed = false
        # self.input_command
    end

    def input_command
        command = gets.chomp
    end
    
    def place_robot(x,y)
        @x = x
        @y = y
        @robot_is_placed = true
    end

    def turn turn_side
        case turn_side
        when 'LEFT'
            if @direction    == 'DOWN'
                @direction   = 'RIGHT'
            elsif @direction == 'RIGHT'
                @direction   = 'UP'
            elsif @direction == 'UP'
                @direction   = 'LEFT'
            elsif @direction == 'LEFT'
                @direction   = 'DOWN'
            end
        when 'RIGHT'
            if @direction    == 'DOWN'
                @direction   = 'LEFT'
            elsif @direction == 'LEFT'
                @direction   = 'UP'
            elsif @direction == 'UP'
                @direction   = 'RIGHT'
            elsif @direction == 'RIGHT'
                @direction   = 'DOWN'
            end
        end
    end

    def move
        case @direction
        when 'UP'
            @y += 1
        when 'DOWN'
            @y -= 1
        when 'LEFT'
            @x -= 1
        when 'RIGHT'
            @x += 1
        end
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

    def validators
        
    end
end
 
robot = Robot.new
robot.validators