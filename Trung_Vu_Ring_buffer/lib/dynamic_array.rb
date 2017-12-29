require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    self.store = StaticArray.new(8)
    self.length = 0
    self.capacity = 8
  end

  # O(1)
  def [](index)
    check_index(index)
    self.store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    self.store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if length == 0

    last = self[length - 1]
    self[length - 1] = nil
    self.length -= 1
    last
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if length == capacity

    self.length += 1
    self[length - 1] = val
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if length == 0

    first = store[0]
    new_array = StaticArray.new(capacity)
    (1..length).each do |i|
      new_array[i - 1] = store[i]
    end
    self.store = new_array
    self.length -= 1
    first
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if length == capacity

    new_array = StaticArray.new(capacity)
    new_array[0] = val
    length.times do |i|
      new_array[i + 1] = store[i]
    end

    self.store = new_array
    self.length += 1
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if index >= length
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_array = StaticArray.new(capacity * 2)

    length.times do |i|
      new_array[i] = self[i]
    end

    self.store = new_array
    self.capacity *= 2
  end
end
