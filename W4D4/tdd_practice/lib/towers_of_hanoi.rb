require 'byebug'

class Piles
    attr_reader :rods

    def initialize
        @rods = [[1, 2, 3], [], []]
    end

    def move(from, to)
        disc = @rods[from].shift
        @rods[to].unshift(disc)
    end

    def won?
        @rods == [[], [], [1, 2, 3]]
    end
end

class Game
    attr_reader :piles

    def initialize
        @piles = Piles.new
    end

    def get_input
        puts "Please enter the piles you would like to move a disc from and to (e.g. '0,2)"
        input = gets.chomp.split(',').map(&:to_i)
        raise "Please input a valid input" if input.any? { |num| !num.between?(0,2) }
        input
    end

    def run
        puts "Welcome to Towers of Hanoi!"
        until piles.won?
            begin
            rescue
                get_input
            retry
            end
        end
    end
end

# game = Game.new
# game.run