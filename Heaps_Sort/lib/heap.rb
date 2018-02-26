class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = Array.new { [] }
    @prc = prc || Proc.new { |a, b| a <=> b }
  end

  def count
    @store.length
  end

  def extract
    #swap the first and last item
    @store[0], @store[count - 1] = @store[count - 1], @store[0]
    #extract the last item
    last = @store.pop
    #rearrange the heap
    self.class.heapify_down(@store, 0, &prc)
    last
  end

  def peek
  end

  #best case: O(1), worst case: O(log(n))
  def push(val)
    @store.push(val)
    self.class.heapify_up(@store, count - 1, &prc)
  end

  def [](val)
    @store[val]
  end

  public

  def self.child_indices(len, parent_index)
    children = []
    (1..2).each do |i|
      child = (parent_index * 2) + i
      children << child if child < len
    end

    children
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0

    ((child_index - 1) / 2)
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc = prc || Proc.new { |a, b| a <=> b }

    first_child_idx, second_child_idx = child_indices(len, parent_idx)

    # this is for the case when parent has less than 2 children (either 1 or 0)
    children = []
    children << array[first_child_idx] if first_child_idx
    children << array[second_child_idx] if second_child_idx

    parent_val = array[parent_idx]

    # check to see if all the children are greater than the parents.
    # If yes, then the heap is in order, return. If not, continue.
    if children.all? { |child| prc.call(parent_val, child) <= 0 }
      return array
    end

    min_child_idx = nil

    # finding the minimum index between the 2 children indices
    if children.length == 1
      min_child_idx = first_child_idx
    else
      if prc.call(array[first_child_idx], array[second_child_idx]) <= 0
        min_child_idx = first_child_idx
      else
        min_child_idx = second_child_idx
      end
    end

    # swap 'em
    array[parent_idx], array[min_child_idx] = array[min_child_idx], array[parent_idx]

    # continue swapping that "parent", now standing at min_child_idx
    self.heapify_down(array, min_child_idx, len, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return array if child_idx == 0 #this is when reaching the root.
    prc = prc || Proc.new { |a, b| a <=> b }

    parent_idx = parent_index(child_idx)

    if prc.call(array[child_idx], array[parent_idx]) <= 0
      array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]
    end

    self.heapify_up(array, parent_idx, array.length, &prc)
  end
end
