require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @length = 0
    @capacity = 8
    @start_idx = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[(index + @start_idx) % @capacity]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    @store[(index + @start_idx) % @capacity] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0

    last = self[@length - 1]
    self[@length - 1] = nil
    @length -= 1
    last
  end

  # O(1) ammortized
  def push(val)
    resize! if @capacity == @length

    @length += 1
    self[@length - 1] = val
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length == 0

    first = self[0]
    self[0] = nil
    @start_idx = (@start_idx + 1) % @capacity
    @length -= 1
    first
  end

  # O(1) ammortized
  def unshift(val)
    resize! if @length == @capacity

    @start_idx = (@start_idx - 1) % @capacity
    @length += 1
    self[0] = val
  end

  protected
  
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if index >= @length
  end

  def resize!
    new_array = StaticArray.new(@capacity * 2)

    @length.times do |i|
      new_array[i] = self[i]
    end

    @store = new_array
    @capacity *= 2
    @start_idx = 0
  end
end
