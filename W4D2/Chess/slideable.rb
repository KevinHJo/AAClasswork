require "byebug"

module Slideable

HORIZANTAL_DIRS = [[1,0],[-1,0],[0,1],[0,-1]]
DIAGONAL_DIRS = [[1,1],[-1,1],[-1,-1],[1,-1]]

    def horizontal_dirs
        return HORIZANTAL_DIRS
    end

    def diagonal_dirs
        return DIAGONAL_DIRS
    end

end
