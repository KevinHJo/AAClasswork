require 'byebug'
require_relative 'piece.rb'

class Rook < Piece
    include Slideable

    def symbol
        if @color == "white"
            '♖'
        else
            '♜'
        end
    end

    private
    def move_dirs
        horizontal_dirs
    end
end