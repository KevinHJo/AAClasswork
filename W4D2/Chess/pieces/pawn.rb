require 'byebug'
require_relative 'piece.rb'

class Pawn < Piece
    def symbol
        if @color == "white"
            '♙'
        else
            '♟︎'
        end
    end

    def moves

    end

    private
    def at_start_row?
    end

    def forward_steps
        if @color == 'white'
            if at_start_row?
                [[0,1]. [0,2]]
            else
                [[0,1]]
            end
        end
        
        if @color == 'black'
            if at_start_row?
                [[0,-1]. [0,-2]]
            else
                [[0,-1]]
            end
        end
    end

    def side_attacks
        [[1,1], [-1, 1]] if 
    end
end