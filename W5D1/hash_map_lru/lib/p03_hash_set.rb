class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key) 
    if @count != num_buckets && !self.include?(key)
      @store[key.hash % num_buckets] << key
      @count += 1
    elsif @count == num_buckets && !self.include?(key)
      resize!
      @store[key.hash % num_buckets] << key
      @count += 1
    end
  end

  def include?(key)
    self[key.hash % num_buckets].include?(key)
  end

  def remove(key)
    if self.include?(key)
      @store[key.hash % num_buckets].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    @store[num]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    if @count == num_buckets
      new_arr = Array.new(num_buckets * 2) { Array.new }
      @store.each do |sub|
        sub.each do |ele|
          new_arr[ele.hash % new_arr.length] << ele
        end
      end
      @store = new_arr
    end
  end
end
