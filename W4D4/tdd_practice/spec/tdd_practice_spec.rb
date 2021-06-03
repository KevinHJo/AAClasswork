require 'tdd_practice.rb'
require 'towers_of_hanoi.rb'

describe 'Array' do
    context '#my_dup' do    
        array = [1, 2, 1, 3, 3]
        it 'should accept an array as an arg' do
            expect{array.my_uniq}.to_not raise_error
        end

        it 'should return a new array without duplicate elements' do
            expect(array.my_uniq).to eq([1,2,3])
        end
    end

    context '#two_sum' do
        array = [-1, 0, 2, -2, 1]
        it 'should return a 2D array containing pairs of elements that add to 0' do
            expect(array.two_sum.all? { |sub| array[sub[0]] + array[sub[1]] == 0 } ).to be true
        end

        it 'sub-arrays should be sorted in ascending numerical order' do
            expect(array.two_sum).to eq([[0, 4], [2, 3]])
        end
    end
end

describe 'my_transpose' do
    matrix = [ [0, 1, 2],
               [3, 4, 5],
               [6, 7, 8] ]

    result = [ [0, 3, 6],
               [1, 4, 7],
               [2, 5, 8] ]

    it 'returns a 2D array containing all columns as rows and all rows as columns' do
        expect(my_transpose(matrix)).to eq(result)
    end
end

describe 'stock_prices' do
    it 'returns an array' do
        expect(stock_prices([1, 2, 3]).is_a?(Array)).to be true
    end

    context 'when there are no repeating prices' do
        it 'returns the most profitable pair of days to buy and sell stock' do 
            expect(stock_prices([120, 124, 123, 122, 125])).to eq([0,4])
        end
    end

    context 'when there are repeating prices' do 
        it 'returns the most profitable pair of days that are closer together' do
            expect(stock_prices([120, 124, 123, 120, 122, 125])).to eq([3, 5])
        end
    end
end

describe 'Towers of Hanoi' do 
    context 'Piles' do
        subject(:piles) { Piles.new }

        context '#initialize' do
            it 'creates a 2D array with 1 "pile" of discs of increasing size and 2 empty subarrays' do
                expect(piles.rods).to eq([[1, 2, 3], [], []])
            end
        end

        context '#move' do
            it 'accepts two integers as arguments' do
                expect{piles.move(0, 1)}.to_not raise_error
            end

            it 'moves the top disc from the pile at the first index to the top of the pile at the second' do
                piles.move(0, 1)
                piles.move(0, 2)
                piles.move(0, 1)
                expect(piles.rods).to eq([[], [3, 1], [2]])
            end
        end

        context 'won?' do
            it 'returns true if all discs have been moved to the final pile in the correct order' do
                piles.move(0, 2)
                piles.move(0, 1)
                piles.move(2, 1)
                piles.move(0, 2)
                piles.move(1, 0)
                piles.move(1, 2)
                piles.move(0, 2)
                
                expect(piles.won?).to be true
            end
        end
    end
end