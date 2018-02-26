# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store

  def initialize
    @store = RingBuffer.new
    @max_queue = RingBuffer.new
  end

  def enqueue(val) #need to check for edge cases when we have more than 1 max of the same value.
    @store.push(val)

    if (@max_queue.length == 0) || (@max_queue[0] < val)
      @max_queue = [val] #when val is a new max, replace => O(1) time
    elsif @max_queue.last > val
      @max_queue.push(val) #when val is less than the last item, push in => O(1) time
    elsif val <= @max_queue.first && val > @max_queue.last
      @max_queue.length.times do
        if @max_queue.last < val
          @max_queue.pop
        else
          @max_queue.push(val)
          return
        end
      end
    end


    # if (@max_queue.length == 0) || (@max_queue[0] < val)
    #   @max_queue = [val]
    # else
    #   (@max_queue.length + 1).times do |i|
    #     if @max_queue[i] == nil || @max_queue[i] < val
    #       @max_queue[i] = val
    #       break
    #     else #if @max_queue[i] > val => keep going
    #       next
    #     end
    #   end
    #   @max_queue
    # end
  end

  def dequeue
    if @store[0] == @max_queue[0]
      @max_queue.shift
    end
    @store.shift
  end

  def max
    @max_queue[0]
  end

  def length
    @store.length
  end
end
