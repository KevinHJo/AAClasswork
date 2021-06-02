require "byebug"

module Stepable 
    #KNIGHT & KING

    


    def moves
        possible_moves = []
        move_diffs.each do |mv|
            possible_move =  [pos[0] + mv[0],pos[1] + mv[1]]
            possible_moves << possible_move if valid_move?(possible_move)
        end
        possible_moves
    end

private 
    def move_diffs
        [[2,1],[2,-1],[-1,2],[1,2],[-2,-1],[-2,1],[-1,-2],[1,-2]]
    end


end