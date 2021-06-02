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
        possible_moves = []

        forward_steps.each do |move|
            possible_moves << [pos[0] + move[0], pos[1] + move[1]]
        end

        unless side_attacks.empty? 
            possible_moves << [pos[0]+side_attacks[0], pos[1] + side_attacks[1]]
        end
        possible_moves
    end

    private
    def at_start_row?
        if @color == "black"
            pos[1] == 1
        else
            pos[1] == 6
        end
    end

    def forward_steps
        if @color == 'white'
            if at_start_row?
                [[0,1], [0,2]]
            else
                [[0,1]]
            end
        end
        
        if @color == 'black'
            if at_start_row?
                [[0,-1], [0,-2]]
            else
                [[0,-1]]
            end
        end
    end 

    def right_attackable?
        if @color == "white"
            @board.rows[pos[0]+1][pos[1]+1].color == "black"
        else
            @board.rows[pos[0]+1][pos[1]-1].color == "white"
        end
    end

    def left_attackable?
        if @color == "white"
            @board.rows[pos[0]-1][pos[1]+1].color == "black"
        else
            @board.rows[pos[0]-1][pos[1]-1].color == "white"
        end
    end

    def side_attacks
        if @color == "white" && right_attackable?
            [1,1]
        elsif @color == "white" && left_attackable?
            [-1,1]
        elsif @color == "black" && right_attackable?
            [1,-1]
        elsif @color == "black" && left_attackable?
            [-1,-1]
        end
    end
end