require 'byebug'
require_relative 'card'

class Deck
    SUITS = [:♠, :♥, :♦, :♣]
    VALUES = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
    attr_reader :cards

    def initialize
        @cards = []
        fill_deck
    end

    def suits
        SUITS
    end

    def values
        VALUES
    end

    def fill_deck
        suits.each do |suit|
            values.each do |value|
                @cards << Card.new(value, suit)
            end
        end
    end
end