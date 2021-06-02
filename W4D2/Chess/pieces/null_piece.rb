require 'byebug'
require_relative 'piece'

class NullPiece < Piece
    include Singleton

    def initialize
        super
    end
end