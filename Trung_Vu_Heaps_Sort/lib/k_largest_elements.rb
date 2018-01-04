require_relative 'heap'

def k_largest_elements(array, k)
  #reverse the heap sort so that we have max heap instead of min heap
  prc = Proc.new { |a, b| -1 * (a <=> b) }
  # this is the heapify step
  array.length.times do |i|
    BinaryMinHeap.heapify_up(array, i, i + 1, &prc)
  end

  result = []
  # this is the sort step
  k.times do |i|
    # swap first and last item
    size = array.length
    array[0], array[size - 1] = array[size - 1], array[0]
    # pop the largest element and push it to our result array
    result.push(array.pop)

    #heapify down the rest of the array, last element untouch
    BinaryMinHeap.heapify_down(array, 0, size - 1, &prc)
  end

  result
end

#Time Complexity: the outer loop runs in O(k) times, but the inner loop runs in O(logn) time => so total Time Complexity is O(klogn) time
