require 'byebug'
require_relative 'piece.rb'

class Bishop < Piece
    include Slideable

    def symbol
        if @color == :white
            ' ♗ '
        else
            ' ♝ '
        end
    end

    private
    def move_dirs
        diagonal_dirs
    end
end