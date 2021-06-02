require 'byebug'
require 'singleton'
require_relative 'piece'

class NullPiece < Piece
    include Singleton
    attr_reader :symbol

    def initialize
        @color = :none
    end

    def symbol
        ' '
    end
end