require 'byebug'
require_relative 'piece.rb'

class Pawn < Piece
    def symbol
        if @color == :white
            '♙'
        else
            '♟︎'
        end
    end

    def moves
        possible_moves = []

        unless forward_steps.nil?
            forward_steps.each do |move|
                possible_moves << [pos[0] + move[0], pos[1] + move[1]]
            end
        end

        unless side_attacks.nil?
            side_attacks.each do |move|
                possible_moves << [pos[0] + move[0], pos[1] + move[1]]
            end
        end

        possible_moves
    end

    # private
    def at_start_row?
        if @color == :black
            pos[0] == 1
        else
            pos[0] == 6
        end
    end

    def forward_steps
        if @color == :white
            if at_start_row? && @board.rows[pos[0]-1][pos[1]].nil? && @board.rows[pos[0]-2][pos[1]].nil?
                [[-1,0], [-2,0]]
            elsif @board.rows[pos[0]-1][pos[1]].nil?
                [[-1,0]]
            end
        end
        
        if @color == :black
            if at_start_row? && @board.rows[pos[0]+1][pos[1]].nil? && @board.rows[pos[0]+2][pos[1]].nil?
                [[1,0], [2,0]]
            elsif @board.rows[pos[0]+1][pos[1]].nil?
                [[1,0]]
            end
        end
    end 

    def right_attackable?
        if @color == "white"
            !@board.rows[pos[0]-1][pos[1]+1].nil? && @board.rows[pos[0]-1][pos[1]+1].color == "black"
        else
            !@board.rows[pos[0]+1][pos[1]+1].nil? && @board.rows[pos[0]+1][pos[1]+1].color == "white"
        end
    end

    def left_attackable?
        if @color == "white"
            !@board.rows[pos[0]-1][pos[1]-1].nil? && @board.rows[pos[0]-1][pos[1]-1].color == "black"
        else
            !@board.rows[pos[0]+1][pos[1]-1].nil? && @board.rows[pos[0]+1][pos[1]-1].color == "white"
        end
    end

    def side_attacks
        possible_moves = []
        possible_moves << [-1,1] if @color == "white" && right_attackable?
        possible_moves << [-1,-1] if @color == "white" && left_attackable?
        possible_moves << [1,1] if @color == "black" && right_attackable?
        possible_moves << [1,-1] if @color == "black" && left_attackable?
        possible_moves 
    end
end