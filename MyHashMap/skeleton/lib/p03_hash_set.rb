class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if count == num_buckets
    idx = key.hash % num_buckets
    @store[idx] << key
    @count += 1
  end

  def include?(key)
    hash = key.hash % num_buckets
    @store[hash].include?(key)
  end

  def remove(key)
    return unless include?(key)
  
    idx = key.hash % num_buckets
    @store[idx].delete(key)
    @count -= 1
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end

  def num_buckets
    @store.length
  end

  def resize!
    arr = Array.new(num_buckets * 2) { [] }
    
    @store.each_with_index do |el, i|
      el.each do |num|
        idx = num.hash % arr.length
        arr[idx] << num
      end
    end
    # @count = 0
    @store = arr
  end
end
