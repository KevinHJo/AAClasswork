require 'byebug'
require_relative 'piece.rb'

class King < Piece
    include Stepable

    def symbol
        if @color == :white
            '♔'
        else
            '♚'
        end
    end

    protected
    def move_diffs
        [[1,0], [-1,0], [0,1], [0,-1], [-1,1], [-1,-1], [1,-1], [1,1]]
    end
end