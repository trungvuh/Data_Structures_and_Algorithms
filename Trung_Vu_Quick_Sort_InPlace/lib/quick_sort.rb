class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    pivot = array[0]

    left, right = []
    (1..array.length).each do |i|
      el = array[i]
      left << el if el <= pivot
      right << el if el > pivot
    end

    self.class.sort1(left) + [pivot] + self.class.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }
    return array if length <= 1
    #pass in the entire array, but only partition from the starting point upto the length that we want.
    pivot_idx = self.partition(array, start, length, &prc)

    sort2!(array, start, pivot_idx - start, &prc)
    sort2!(array, pivot_idx + 1, (length - pivot_idx + start - 1), &prc)
    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }

    # new_pivot = start + rand(array.length)
    # array[start], array[new_pivot] = array[new_pivot], array[start]

    pointer = start
    pivot = array[start]

    (length - 1).times do |i|
      if prc.call(array[start + 1 + i], pivot) == 1
        next
      else
        array[start + 1 + i], array[pointer + 1] =
          array[pointer + 1], array[start + 1 + i]
        pointer += 1
      end

    end
    array[start], array[pointer] = array[pointer], array[start]
    pointer
  end
end
