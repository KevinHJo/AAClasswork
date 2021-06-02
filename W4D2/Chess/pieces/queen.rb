
require 'byebug'
require 'slideable'

class Queen < Piece
    include Slideable

    private
    
    def move_dirs
        horizontal_dirs + diagonal_dirs
    end
end