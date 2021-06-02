require 'byebug'
require_relative "../board.rb"
require_relative "slideable"
require_relative "stepable"

class Piece
    attr_reader :pos
    
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
    end

    def empty?
    end

    def valid_moves
    end

    def pos=(val)
    end

    def Symbol
    end

    private

    def move_into_check?(end_pos)
    end
end