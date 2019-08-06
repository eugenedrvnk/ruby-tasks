class Table
    def initialize options
        @rows_count = options[:rows_count]+1
        @columns_count = options[:columns_count]+1
    end

    def generate_table
        result_array = []
        0.upto(@rows_count) do |i|
            row = []
            0.upto(@columns_count) do |j|
                if i == 0 || i == @rows_count || j == 0 || j == @columns_count
                    row.push('#')
                else
                    row.push(' ')
                end
            end
            result_array.push(row)
        end
        result_array
    end
end