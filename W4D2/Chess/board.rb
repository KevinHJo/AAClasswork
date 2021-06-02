require 'byebug'
require_relative 'pieces/pawn.rb'
require_relative 'pieces/piece.rb'

class Board
    attr_reader :rows

    def initialize
        @rows = Array.new(8) {Array.new(8)}
        fill_rows
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
        #order = [Rook,Knight,Bishop,Queen,King,Bishop,Knight,Rook]
        order = [Piece, Piece, Piece, Piece, Piece, Piece, Piece, Piece,]
        order.each_with_index do |ele, i|
            @rows[0][i] = ele.new("black", self, [0,i])
        end
        
        order.each_with_index do |ele, i|
            @rows[7][i] = ele.new("white", self, [7,i])
        end
    end

    def move_piece(start_pos, end_pos) # => [num, num]
        raise ArgumentError.new "Invalid start position" if @rows[start_pos[0]][start_pos[1]].nil? || start_pos.any? { |ele| ele > 7 || ele < 0 }
        raise ArgumentError.new "Invalid end position" if end_pos.any? { |ele| ele > 7 || ele < 0 }

        piece = @rows[start_pos[0]][start_pos[1]] 
        @rows[start_pos[0]][start_pos[1]] = nil
        @rows[end_pos[0]][end_pos[1]] = piece
        @rows[end_pos[0]][end_pos[1]].pos = end_pos
    end
end