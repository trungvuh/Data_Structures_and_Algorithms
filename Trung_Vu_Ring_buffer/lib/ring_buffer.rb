require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    self.store = StaticArray.new(8)
    self.length = 0
    self.capacity = 8
    self.start_idx = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    self.store[(index + start_idx) % capacity]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    self.store[(index + start_idx) % capacity] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if length == 0

    last = self[length - 1]
    self[length - 1] = nil
    self.length -= 1
    last
  end

  # O(1) ammortized
  def push(val)
    resize! if capacity == length

    self.length += 1
    self[length - 1] = val
  end

  # O(1)
  def shift
    raise "index out of bounds" if length == 0

    first = self[0]
    self[0] = nil
    self.start_idx = (start_idx + 1) % capacity
    self.length -= 1
    first
  end

  # O(1) ammortized
  def unshift(val)
    resize! if length == capacity

    self.start_idx = (start_idx - 1) % capacity
    self.length += 1
    self[0] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if index >= length
  end

  def resize!
    new_array = StaticArray.new(capacity * 2)

    length.times do |i|
      new_array[i] = self[i]
    end

    self.store = new_array
    self.capacity *= 2
    self.start_idx = 0
  end
end
