class MaxIntSet
  attr_reader :store
  def initialize(max)
      @store = Array.new(max)
  end

  def insert(num)
    if is_valid?(num) 
      @store[num] = true
    else
      raise 'Out of bounds'
    end
  end

  def remove(num)
    if num.between?(0,@store.length) 
      @store[num] = false
    else
      raise 'Out of bounds'
    end
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
    num.between?(0,@store.length)
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % num_buckets] << num
  end

  def remove(num)
    @store[num % num_buckets].delete(num)
  end

  def include?(num)
    self[num % num_buckets].include?(num)
  end

  private

  def [](num)
    @store[num]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self.include?(num) && count != num_buckets
      @store[num % num_buckets] << num
      @count += 1
    elsif !self.include?(num) && count == num_buckets
      resize!
      @store[num % num_buckets] << num
      @count += 1
    end
  end
#[[0], [1], [2], [3]]
#[[0], [1], [2], [3], [4]] 
#[[0], [1], [2], [3], [4], [5]] 
#[[0], [1], [2], [3], [4], [5], [6]] 

#[[0], [1], [2], [3]]
#[[0], [1], [2], [3], [], [], [], []]

  def remove(num)
    if self.include?(num)
      @store[num % num_buckets].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    return true if @store[num % num_buckets].include?(num)
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    if count == num_buckets
      new_arr = Array.new(num_buckets * 2) { Array.new }
      @store.each do |subarr|
        subarr.each do |num|
          new_arr[num % new_arr.length] << num
        end
      end

      @store = new_arr
    end
  end

end
