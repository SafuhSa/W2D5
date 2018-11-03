class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList 
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @tail.prev = @head
    @head.next = @tail
  
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    return nil if @head.next.nil?
    @head.next
  end

  def last
    return nil if @tail.prev.nil?
    @tail.prev
  end

  def empty?
    @head.next == @tail# && @tail.prev == @head 
    # && @head.prev.nil? && @tail.next.nil?
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    new_node = Node.new(key,val)
    previous = last
    @tail.prev = new_node
    previous.next = new_node
  end

  def update(key, val)
    
  end

  def remove(key)
  end

  def each
    check_node = first
    until check_node == @tail
      yield(check_node)
      check_node = check_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
