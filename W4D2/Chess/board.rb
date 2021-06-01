require 'byebug'
require_relative 'pieces/piece.rb'

class Board
    def initialize
        @rows = Array.new(8) {Array.new(8)}
    end

    def fill_rows
        self.fill_front_row
        self.fill_back_row
    end

    def fill_front_row
        @rows[1].each_with_index do |ele, i|
            @rows[1][i] = Pawn.new("black", self, [1,i]) #INHERITED
        end
        @rows[6].each_with_index do |ele, i|
            @rows[6][i] = Pawn.new("white", self, [6,i]) #INHERITED
        end
    end

    def fill_back_row
        order = [Rook,Knight,Bishop,Queen,King,Bishop,Knight,Rook]
        order.each_with_index do |ele, i|
            @rows[0][i] = ele.new("black", self, [0,i])
        end
        
        order.each_with_index do |ele, i|
            @rows[7][i] = ele.new("white", self, [7,i])
        end
    end

    def move_piece(start_pos, end_pos) # => [num, num]
        raise ArgumentError.new "Invalid start position" if @grid[start_pos[0], start_pos[1]].nil?
        raise ArgumentError.new "Invalid end position" if end_pos.any? { |ele| ele > 7 || ele < 0 }

        
    end
end