require 'byebug'
require_relative 'pieces/required_pieces.rb'

class Board
    attr_reader :rows

    def initialize
        @rows = Array.new(8) {Array.new(8)}
        @null = NullPiece.instance
        fill_rows
    end

    
    def [](y,x)
        self.rows[y][x]
    end

    def []=(y,x,val)
        self.rows[y][x] = val
    end

    def valid_pos?(pos)
        pos[0] > 0 && pos[0] < 8 && pos[1] > 0 && pos[1] < 8 
    end

    def fill_rows
        self.fill_front_row
        self.fill_back_row
        self.fill_empty_rows
    end

    def fill_front_row
        @rows[1].each_with_index do |ele, i|
            @rows[1][i] = Pawn.new(:black, self, [1,i]) #INHERITED
        end
        @rows[6].each_with_index do |ele, i|
            @rows[6][i] = Pawn.new(:white, self, [6,i]) #INHERITED
        end
    end

    def fill_back_row
        order = [Rook,Knight,Bishop,Queen,King,Bishop,Knight,Rook]
        order.each_with_index do |ele, i|
            @rows[0][i] = ele.new(:black, self, [0,i])
        end
        
        order.each_with_index do |ele, i|
            @rows[7][i] = ele.new(:white, self, [7,i])
        end
    end

    def fill_empty_rows
        (2..5).each do |i1|
            (0..7).each do |i2|
                @rows[i1][i2] = @null
            end
        end
    end

    def move_piece(start_pos, end_pos) # => [num, num]
        raise ArgumentError.new "Invalid start position" if @rows[start_pos[0]][start_pos[1]].is_a?(NullPiece) || start_pos.any? { |ele| ele > 7 || ele < 0 }
        raise ArgumentError.new "Invalid end position" if end_pos.any? { |ele| ele > 7 || ele < 0 } || !@rows[start_pos[0]][start_pos[1]].moves.include?(end_pos)

        piece = @rows[start_pos[0]][start_pos[1]] 
        @rows[start_pos[0]][start_pos[1]] = @null
        @rows[end_pos[0]][end_pos[1]] = piece
        @rows[end_pos[0]][end_pos[1]].pos = end_pos
    end
end