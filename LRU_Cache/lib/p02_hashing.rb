class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash_sum = 0
    self.each_index do |i|
      hash_sum += (self[i].hash + i).hash
    end
    hash_sum
  end
end

class String
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort_by(&:hash).hash
  end
end
