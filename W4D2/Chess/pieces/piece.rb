require 'byebug'
require_relative "../board.rb"
require_relative "slideable"
require_relative "stepable"

class Piece
    attr_reader :pos, :board, :color

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
    end

    def empty?
        self.is_a?(NullPiece)
    end

    def valid_move?(target) 
        return false if target[0] > 7 || target[0] < 0 || target[1] > 7 || target[1] < 0
        return false if @board.rows[target[0]][target[1]].color == self.color
        true
    end

    def pos=(val)
        @pos = val
    end

    private
    def move_into_check?(end_pos)
    end
end