# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store
  # , :length, :capacity, :start_idx

  def initialize
    self.store = RingBuffer.new()
    # self.length = 0
    # self.capacity = 8
    # self.start_idx = 0
  end

  def [](index)
    check_index(index)
    self.store[(index + start_idx) % capacity]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    self.store[(index + start_idx) % capacity] = val
  end

  def enqueue(val)

  end

  def dequeue
  end

  def max
  end

  def length
  end

  def check_index(index)
    raise "index out of bounds" if index >= length
  end

end
