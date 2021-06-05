require 'byebug'

def my_min(arr)
    smalest = 0

    (0...arr.length-1).each do |i|
       smalest = arr[i] if !arr.any? { |ele| ele < arr[i] }
    end
    return smalest
end

def my_min_faster(arr)
    min = arr[0]
    arr.each do |ele|
        min = ele if ele < min
    end
    min
end

def largest_contiguous_subsum(list)
    sum = 0
    biggest_sum = list[0]
    sub_arrays = []

    list.each_with_index do |ele1, i1|
        list.each_with_index do |ele2, i2|
            if i2 >= i1
                sub_arrays << list[i1..i2]
            end
        end
    end

    sub_arrays.each do |sub|
        sum = sub.sum
        biggest_sum = sum if sum > biggest_sum
    end

    biggest_sum
end

# def largest_contiguous_subsum_faster(list)
#     # # debugger
#     # sum = 0
#     # # biggest_sum = 0
#     # return 0 if list.empty?
#     # return list[0] if list.length == 1
#     # sum = list[0] + largest_contiguous_subsum_faster(list[1..-1])
#     # # biggest_sum = sum if sum > biggest_sum
# end

def largest_contiguous_subsum_faster(list)
    current_max = list[0]
    test_max = list[0]
    (1...list.length).each do |i|
        if list[i] > current_max + list[i]
            current_max = list[i]
        else
            current_max += list[i]
        end

        if test_max < current_max
            test_max = current_max
        end    
    end
    test_max   
end

list = [5, 3, -7]
list = [4, 1, -2, 3]
list = [-2, -3, 4, -1, -2, 1, 5, -3]
p largest_contiguous_subsum_faster(list)