require "byebug"
require_relative "../skeleton/lib/00_tree_node.rb"


class KnightPathFinder
    def self.valid_moves(pos)
        positions = []

        moves = [2, -2, 1, -1].permutation(2).to_a.uniq.select { |sub| sub.uniq == sub && sub[0] + sub[1] != 0 }
        moves.each do |move|
            new_position = []
            
            move.each_with_index do |num, i|
                new_position << pos[i] + num
            end

            positions << new_position if new_position[0] >= 0 && new_position[0] <= 8 && new_position[1] >= 0 && new_position[1] <= 8
        end

        positions
    end

    def initialize(start)
        @start = start
        @root_node = PolyTreeNode.new(start)
        @move_tree = build_move_tree
        @considered_positions = []
    end
    
    def new_move_positions(pos)
        new_moves = KnightPathFinder.valid_moves(pos)
        new_moves.reject! { |move| @considered_positions.include?(move) }
        @considered_positions += new_moves
        new_moves
    end

    def build_move_tree
        
    end
end