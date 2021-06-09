require 'byebug'
require_relative 'deck'

class Hand
    ORDER = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
    attr_reader :cards, :deck

    def initialize(deck)
        @deck = deck
        @cards = grab_hand
    end

    def grab_hand
        cards = []
        @deck.shuffle_deck
        5.times { cards << @deck.take_top_card }
        cards
    end

    def order
        ORDER
    end

    def sort_cards_by_value
        sorted = cards.sort_by { |card| order.index(card.value) }
        sorted.map!(&:value)
        if sorted.include?(:A)
            sorted.unshift(:A) if sorted[-1] == :A
            sorted.push(:A) if sorted[0] == :A
        end
        sorted
    end
    
    def high_card
        sort_cards_by_value.reverse
    end

    def one_pair?
        (0...4).each do |i1|
            (i1+1...5).each do |i2|
                return true if cards[i1].value == cards[i2].value
            end
        end
        false
    end

    def two_pair?
        count = 0
        (0...4).each do |i1|
            (i1+1...5).each do |i2|
                count += 1 if cards[i1].value == cards[i2].value
            end
        end
        count >= 2
    end

    def three_of_a_kind?
        count = 0
        (0...4).each do |i1|
            (i1+1...5).each do |i2|
                count += 1 if cards[i1].value == cards[i2].value
            end
        end
        count >= 3
    end

    def straight?
        sorted = sort_cards_by_value
        sorted.pop if sorted.include?(:A) && sorted.include?(2)
        sorted.shift if sorted.include?(:A) && sorted.include?(:K)
        sorted.each_with_index do |value, i|
            if i != sorted.length - 1 && sorted[i+1] != :A
                next_value = sorted[i+1]
                return false if order.index(next_value) - order.index(value) != 1
            elsif i != sorted.length - 1 && sorted[i+1] == :A
                next_value = 13
                return false if next_value - order.index(value) != 1
            end
        end
        true
    end

    def flush?
        cards.all? { |card| card.suit == cards[0].suit }
    end

    def full_house?
        sorted = sort_cards_by_value
        sliced = sorted.slice_when { |ele1, ele2| ele1 != ele2 }.to_a
        sliced.length == 2
    end

    def four_of_a_kind?
        count = 0
        (0...4).each do |i1|
            (i1+1...5).each do |i2|
                count += 1 if cards[i1].value == cards[i2].value
            end
        end
        count >= 4
    end

    def straight_flush?
        straight? && flush?
    end

    # private #=> COMMENT OUT FOR TESTING PURPOSES
    def cards=(arr)
        @cards = arr
    end
end