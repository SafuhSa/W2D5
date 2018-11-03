class MaxIntSet
  def initialize(max)
    @size = max
    @store = Array.new(max) {false}
  end

  def insert(num)
    validate!(num)
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    validate!(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
    num <= @size && num >= 0
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    idx = num % num_buckets
    @store[idx] << num
  end

  def remove(num)
    idx = num % num_buckets
    @store[idx].delete(num)
  end

  def include?(num)
    idx = num % @store.count
    @store[idx].each do |el|
      return  true if el == num
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return if include?(num) 
    resize! if num_buckets == @count+1 
    @count += 1
    idx = num % num_buckets
    @store[idx] << num
    
  end

  def remove(num)
    idx = num % num_buckets
    if @store[idx].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    idx = num % num_buckets
    @store[idx].each do |n|
      return true if n == num
    end
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
    arr = Array.new(num_buckets * 2) { Array.new }
    
    @store.each do |sub|
      sub.each {|el| arr[el % arr.length] << el }
    end
    @store = arr
  end
end
