require 'byebug'
require_relative 'piece.rb'

class Board
    def initialize
        @rows = Array.new(8) {Array.new(8)}
    end

    def fill_rows
        self.fill_front_row
        self.fill_back_row
    end

    def fill_front_row
        @rows[1].each_with_index do |ele, i|
            @rows[1][i] = Pawn.new("black",[1,i]) #INHERITED
        end
        @rows[6].each_with_index do |ele, i|
            @rows[6][i] = Pawn.new("white",[6,i]) #INHERITED
        end
    end

    def fill_back_row
       order = [Rook,Knight,Bishop,Queen,King,Bishop,Knight,Rook]
        order.each_with_index do |ele, i|
            @rows[0][i] = ele.new("black",[0,i])
        end
        order.each_with_index do |ele, i|
            @rows[7][i] = ele.new("white",[7,i])
        end
    end
end