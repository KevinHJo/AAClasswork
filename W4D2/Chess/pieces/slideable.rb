require "byebug"

module Slideable 
    HORIZONTAL_DIRS = [[1,0],[-1,0],[0,1],[0,-1]]
    DIAGONAL_DIRS = [[1,1],[-1,1],[-1,-1],[1,-1]]

    def horizontal_dirs
        return HORIZONTAL_DIRS
    end

    def diagonal_dirs
        return DIAGONAL_DIRS
    end

    def moves
        total_possible_moves = []
        
        move_dirs.each do |dir|
            possible_moves = [pos]
            x = 0
            y = 0
            
            until x > 7 || x < 0 || y > 7 || y < 0
                x = dir[0] + possible_moves[-1][0] 
                y = dir[1] + possible_moves[-1][1]

                if x >= 0 && y >= 0 && x < 8 && y < 8 && !total_possible_moves.include?([x,y])
                    possible_moves << [x, y]
                end   
            end  
            total_possible_moves += possible_moves[1..-1]
        end

        total_possible_moves
    end

    private
    def move_dirs

    end
end