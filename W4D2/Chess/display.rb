require 'byebug'
require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
    def initialize(board)
        @cursor = Cursor.new([0,0], board)
        @board = board
    end

    def build_grid
        @board.rows.map.with_index do |row, i|
          build_row(row, i)
        end
      end
    
      def build_row(row, i)
        row.map.with_index do |piece, j|
          color_options = colors_for(i, j)
          piece.symbol.colorize(color_options)
        end
      end
    
      def colors_for(i, j)
        if [i, j] == @cursor_pos
          bg = :light_red
        elsif (i + j).odd?
          bg = :light_blue
        else
          bg = :blue
        end
        { background: bg, color: :white }
      end
    
      def render
        system("clear")
        puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
        build_grid.each { |row| puts row.join }
      end
end
