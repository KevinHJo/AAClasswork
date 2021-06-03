require 'byebug'

class Array
    def my_uniq
        hash = Hash.new(0)
        self.each { |ele| hash[ele] = 0 }
        hash.keys
    end

    def two_sum
        zeros = []
        (0...self.length - 1).each do |i1|
            (i1 + 1...self.length).each do |i2|
                x = self[i1]
                y = self[i2]
                zeros << [i1, i2] if x + y == 0
            end
        end
        zeros.uniq.map(&:sort)
    end
end

def my_transpose(arr)
    transposed = []
    (0...arr.length).each do |i|
        row = []
        arr.each { |sub| row << sub[i]}
        transposed << row
    end
    transposed
end

def stock_prices(arr)
    most_profit = [0,1]
    greatest_diff = arr[most_profit[1]] - arr[most_profit[0]]

    (0...arr.length - 1).each do |i1|
        (i1 + 1...arr.length).each do |i2|
            current_diff = arr[i2] - arr[i1]
            if current_diff >= greatest_diff
                most_profit = [i1, i2]
                greatest_diff = current_diff
            end
        end
    end
    most_profit
end