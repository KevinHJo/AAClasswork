
require 'byebug'
require_relative "piece.rb"
require_relative "slideable.rb"


class Queen < Piece
    include Slideable

    private
    
    def move_dirs
        horizontal_dirs + diagonal_dirs
    end
end