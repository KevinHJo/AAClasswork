require "byebug"
def bad_sum?(arr, target)
    (0...arr.length-1).each do |i1|
        (i1+1...arr.length).each do |i2|
            return true if arr[i1] + arr[i2] == target
        end
    end
    return false
end
arr = [0, 1, 5, 7]
# p bad_sum?(arr, 6) # => should be true
# p bad_sum?(arr, 10) # => should be false

def okay_sum?(arr, target)
    # debugger
    sorted = arr.sort
    sorted.each_with_index do |ele, i|
        if i != arr.length - 1
            remain = target - ele
            return true unless sorted[i+1..-1].bsearch_index { |ele2| remain - ele2 }.nil?
        end
        
        # remain = target - ele
        # return true unless bsearch(sorted[i+1..-1], remain).nil?
    end
    return false
end

def bsearch(array, target)
    return nil if array.size == 0
    mid = array.size/2

    case array[mid] <=> target
    when 0
      return mid
    when 1
      return bsearch(array.take(mid), target)
    else
      search_res = bsearch(array.drop(mid+1), target)
      search_res.nil? ? nil : mid + 1 + search_res
    end
  end

# p okay_sum?(arr, 6)
# p okay_sum?(arr, 10)

def two_sum?(array, target)
    map = Hash.new(0)
    array.each { |num| map[num] = target - num }
    map.values.each { |value| return true if map.has_key?(value) && map[value] != value }

    return false
end

p two_sum?(arr, 6)
p two_sum?(arr, 10)