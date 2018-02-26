require_relative "heap"

class Array
  def heap_sort!
    #reverse the heap sort so that we have max heap instead of min heap
    prc = Proc.new { |a, b| -1 * (a <=> b) }
    # this is the heapify step
    self.length.times do |i|
      BinaryMinHeap.heapify_up(self, i, i + 1, &prc)
    end

    # this is the sort step
    self.length.downto(1).each do |sub_length|
      # swap first and last item
      self[0], self[sub_length - 1] = self[sub_length - 1], self[0]
      #heapify down the rest of the array, last element untouch
      BinaryMinHeap.heapify_down(self, 0, sub_length - 1, &prc)

    end

    self
  end
end

# Time complexity is O(nlogn). The reason is the outer loop run in O(n) time, while the inner loop (the heapify process) run in O(logn) time - since we only do at most logn steps.
