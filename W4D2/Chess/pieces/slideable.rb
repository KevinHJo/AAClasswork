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
        possible_moves = []

        move_dirs.each do |dir|
            possible_moves << [dir[0] + pos[0], dir[1] + pos[1]]
        end

        possible_moves
    end

    private
    def move_dirs

    end
end