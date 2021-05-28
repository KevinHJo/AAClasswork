require "byebug"
require_relative "../skeleton/lib/00_tree_node.rb"


class KnightPathFinder
    def self.valid_moves(pos)
        positions = []

        moves = [2, -2, 1, -1].permutation(2).to_a.uniq.select { |sub| sub.uniq == sub && sub[0] + sub[1] != 0 }

    end

    def initialize(start)
        @start = start
        @root_node = PolyTreeNode.new(start)
        @move_tree = build_move_tree
    end

    def build_move_tree

    end
end