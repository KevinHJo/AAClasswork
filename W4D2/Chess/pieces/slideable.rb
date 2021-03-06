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

    def next_same_color?(pos, move)
        next_x = move[1] + pos[1]
        next_y = move[0] + pos[0]
        
        return false if @board.rows[next_y][next_x].is_a?(NullPiece) || next_x > 7 || next_x < 0 || next_y > 7 || next_y < 0
        @board.rows[next_y][next_x].color == self.color
    end

    def different_color?(pos)
        x = pos[1]
        y = pos[0]
        return false if @board.rows[pos[0]][pos[1]].is_a?(NullPiece) || x > 7 || x < 0 || y > 7 || y < 0
        @board.rows[pos[0]][pos[1]].color != self.color && @board.rows[pos[0]][pos[1]].color != nil
    end

    def moves
        total_possible_moves = []
        # debugger
        move_dirs.each do |dir|
            possible_moves = [pos]
            y = pos[0]
            x = pos[1]
            
            until x > 7 || x < 0 || y > 7 || y < 0 || self.next_same_color?([y,x], dir) || self.different_color?([y,x]) 
                y = dir[0] + possible_moves[-1][0] 
                x = dir[1] + possible_moves[-1][1]

                if x >= 0 && y >= 0 && x < 8 && y < 8 && !total_possible_moves.include?([y,x])
                    possible_moves << [y,x]
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