class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    # [1, 2, 3] != [3, 2, 1]
    #[1, 2, 3] != [1, 3, 2]
    sum = 0
    self.each_with_index do |el, i|
      sum += (el.hash * i)
    end
    sum
   
  end
end

class String
  def hash
    sum = 0
    self.each_char.with_index do |el, i|
      sum += (el.ord.hash * i)
    end
    sum
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0
    self.each do |k,v|
      sum += (k.hash + v.hash)
    end
    sum
  end
end
