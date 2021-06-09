require 'game'

describe 'Card' do
    subject(:card) { Card.new(:A, :♠) }

    context '#initialize' do
        it 'accepts two arguments' do
            expect{Card.new(:A, :♠)}.to_not raise_error
        end

        it 'assigns the first argument to an instance variable: value' do
            expect(card.value).to eq(:A)
        end

        it 'assigns the second argument to an instance variable: suit' do
            expect(card.suit).to eq(:♠)
        end
    end
end

describe 'Deck' do
    subject(:deck) { Deck.new }

    context '#initialize' do
        it 'initializes with a deck instance variable as an array of Card instances' do
            expect(deck.cards.all? { |card| card.is_a?(Card) }).to be true
        end

        it 'deck instance variable is populated by 52 unique cards' do
            unique_cards = []
            deck.cards.each { |card| unique_cards << [card.value, card.suit] }
            expect(unique_cards.uniq.length).to eq(52)
        end
    end

    context '#shuffle_deck' do
        it 'randomly changes the order of the deck' do
            deck.shuffle_deck
            expect(deck.cards).not_to eq(Deck.new.cards)
        end
    end

    context '#take_top_card' do
        it 'selects the top card from the deck' do
            expect(deck.take_top_card.value).to eq(Deck.new.cards[0].value)
            expect(deck.take_top_card.suit).to eq(Deck.new.cards[0].suit)
        end
    end
end

describe 'Hand' do
    let(:deck) { Deck.new }
    subject(:hand1) { Hand.new(deck) }
    subject(:hand2) { Hand.new(deck) }

    context '#initialize' do
        it 'assigns @deck as the given argument' do
            expect(hand1.deck).to be(deck)
        end

        it 'initializes with a cards instance variable as an array of Card instances' do
            expect(hand1.cards.all? { |card| card.is_a?(Card) }).to be true
        end

        it 'cards instance variable is populated with 5 random cards from a Deck instance' do
            expect(hand1.cards.length).to eq(5)
            expect(hand1.cards).to_not eq(hand2.cards)
        end
    end

    context '#grab_hand' do
        it 'removes the top 5 cards from the shuffled deck' do
            expect(hand1.deck.cards.length).to eq(47)
        end

        it 'assigns the 5 cards to @cards' do
            expect(hand1.cards.length).to eq(5)
        end
    end

    context '#high_card' do
        it 'returns an array of card values sorted from highest to lowest' do
            hand1.cards = [Card.new(:J, :♠), Card.new(10, :♦), Card.new(6, :♠), Card.new(:A, :♦), Card.new(7, :♠)]
            expect(hand1.high_card).to eq([:A, :J, 10, 7, 6, :A])
        end
    end

    context '#one_pair?' do
        it 'returns true if there is one value pair in the hand' do
            hand1.cards = [Card.new(:J, :♠), Card.new(:J, :♦), Card.new(6, :♠), Card.new(9, :♦), Card.new(7, :♠)]
            expect(hand1.one_pair?).to be true
        end
    end

    context '#two_pair?' do
        it 'returns true if there are two value pairs in the hand' do
            hand1.cards = [Card.new(:J, :♠), Card.new(:J, :♦), Card.new(:A, :♠), Card.new(:A, :♦), Card.new(7, :♠)]
            expect(hand1.two_pair?).to be true
        end

        it 'returns false if there are less than two value pairs in the hand' do
            hand1.cards = [Card.new(:J, :♠), Card.new(:J, :♦), Card.new(:A, :♠), Card.new(6, :♦), Card.new(7, :♠)]
            expect(hand1.two_pair?).to be false
        end
    end

    context '#three_of_a_kind?' do
        it 'returns true if there are three equal values in the hand' do
            hand1.cards = [Card.new(:J, :♠), Card.new(:J, :♦), Card.new(:J, :♥), Card.new(:A, :♦), Card.new(7, :♠)]
            expect(hand1.three_of_a_kind?).to be true
        end

        it 'returns false if there are less than three equal values in the hand' do
            hand1.cards = [Card.new(:J, :♠), Card.new(:A, :♦), Card.new(:J, :♥), Card.new(:A, :♦), Card.new(7, :♠)]
            expect(hand1.three_of_a_kind?).to be false
        end
    end

    context '#straight?' do
        it 'returns true if the hand contains 5 cards of sequential rank' do
            hand1.cards = [Card.new(7, :♠), Card.new(6, :♦), Card.new(5, :♥), Card.new(4, :♦), Card.new(3, :♠)]
            expect(hand1.straight?).to be true
        end

        it 'returns false if the hand does not contain 5 cards of sequential rank' do
            hand1.cards = [Card.new(7, :♠), Card.new(6, :♦), Card.new(5, :♥), Card.new(4, :♦), Card.new(2, :♠)]
            expect(hand1.straight?).to be false
        end

        it 'accounts for the fact that an Ace exists at both the beginning and the end of the sequence' do
            hand1.cards = [Card.new(5, :♠), Card.new(4, :♦), Card.new(3, :♥), Card.new(2, :♦), Card.new(:A, :♠)]
            hand2.cards = [Card.new(:A, :♠), Card.new(:K, :♦), Card.new(:Q, :♥), Card.new(:J, :♦), Card.new(10, :♠)]
            expect(hand1.straight?).to be true
            expect(hand2.straight?).to be true
        end
    end

    context '#flush?' do
        it 'returns true if the hand contains 5 cards of the same suit' do
            hand1.cards = [Card.new(7, :♠), Card.new(8, :♠), Card.new(5, :♠), Card.new(4, :♠), Card.new(3, :♠)]
            expect(hand1.flush?).to be true
        end

        it 'returns false if the hand does not contain 5 cards of the same suit' do
            hand1.cards = [Card.new(7, :♠), Card.new(8, :♠), Card.new(5, :♥), Card.new(4, :♠), Card.new(3, :♠)]
            expect(hand1.flush?).to be false
        end
    end

    context '#full_house?' do
        it 'returns true if the hand contains 3 cards of one value AND 2 cards of another' do
            hand1.cards = [Card.new(7, :♠), Card.new(7, :♥), Card.new(7, :♦), Card.new(3, :♠), Card.new(3, :♦)]
            expect(hand1.full_house?).to be true
        end

        it 'returns false if the hand does not contain 3 cards of one value AND 2 cards of another' do
            hand1.cards = [Card.new(7, :♠), Card.new(7, :♥), Card.new(7, :♦), Card.new(4, :♠), Card.new(3, :♦)]
            hand2.cards = [Card.new(7, :♠), Card.new(7, :♥), Card.new(4, :♦), Card.new(3, :♠), Card.new(3, :♦)]
            expect(hand1.full_house?).to be false
            expect(hand2.full_house?).to be false
        end
    end

    context '#four_of_a_kind?' do
        it 'returns true if there are four equal values in the hand' do
            hand1.cards = [Card.new(:J, :♠), Card.new(:J, :♦), Card.new(:J, :♥), Card.new(:J, :♦), Card.new(7, :♠)]
            expect(hand1.four_of_a_kind?).to be true
        end

        it 'returns false if there are less than four equal values in the hand' do
            hand1.cards = [Card.new(:J, :♠), Card.new(:J, :♦), Card.new(:A, :♥), Card.new(:J, :♦), Card.new(7, :♠)]
            expect(hand1.four_of_a_kind?).to be false
        end
    end

    context '#straight_flush?' do
        it 'returns true if the hand contains cards with 5 sequential values in the same suit' do
            hand1.cards = [Card.new(7, :♠), Card.new(6, :♠), Card.new(5, :♠), Card.new(4, :♠), Card.new(3, :♠)]
            expect(hand1.straight_flush?).to be true
        end

        it 'accounts for the fact that an Ace exists at both the beginning and the end of the sequence' do
            hand1.cards = [Card.new(5, :♠), Card.new(4, :♠), Card.new(3, :♠), Card.new(2, :♠), Card.new(:A, :♠)]
            hand2.cards = [Card.new(:A, :♠), Card.new(:K, :♠), Card.new(:Q, :♠), Card.new(:J, :♠), Card.new(10, :♠)]
            expect(hand1.straight_flush?).to be true
            expect(hand2.straight_flush?).to be true
        end
    end
end