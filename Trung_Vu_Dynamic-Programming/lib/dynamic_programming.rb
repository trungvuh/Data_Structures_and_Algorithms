class DynamicProgramming

  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
    @frog_cache = {
      1 => [[1]],
      2 => [[1, 1], [2]],
      3 => [[1, 1, 1], [1, 2], [2, 1], [3]]
    }
    @knapsack_cache = {}
  end

  def blair_nums(n)
    # Check the cache for a stored answer
    # If not found,
    # 1) perform the recursion,
    # 2) store the answer,
    # 3) return the answer.
    return @blair_cache[n] unless @blair_cache[n].nil?

    #the (n-1)th odd number is 2(n-1) - 1
    ans = blair_nums(n - 1) + blair_nums(n - 2) + (2*(n - 1) - 1)
    @blair_cache[n] = ans
    ans
  end

  def frog_hops_bottom_up(n)
    # call the helper function
    frog_cache = frog_cache_builder(n)
    # then return the nth entry
    frog_cache[n]
  end

  def frog_cache_builder(n)
    # Make a hash or array for storing previous solutions
    # Add the base cases to the cache
    # Build solutions 4..n into the cache
    # Return the cache
    frog_cache = {
      1 => [[1]],
      2 => [[1, 1], [2]],
      3 => [[1, 1, 1], [1, 2], [2, 1], [3]]
    }
    return frog_cache if n <= 3

    # super janky way?
    (4..n).each do |i| #O(n)
      frog_cache[i] = []
      (1..3).each do |j|
        frog_cache[i - j].each do |el1| #actually this is only 3 times
          frog_cache[j].each do |el2| #this is also only 3 times. May not be that bad
            frog_cache[i] << el1 + el2
          end
        end
      end
      frog_cache[i].uniq!
    end
    frog_cache
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    return @frog_cache[n] if n <= 3

    # iterate through each of the pair (n-1)&1, (n-2)&2, (n-3)&3.
    # Find every possible combinations between them.
    # Not very efficient. There must be other ways.
    # Using a hash for O(1) lookup time, still feel this one is pretty bad

    result = {}
    (1..3).each do |i|
      frog_hops_top_down_helper(n - i).each do |el1|
        frog_hops_top_down_helper(i).each do |el2|
          result[el1 + el2] = true
        end
      end
    end
    @frog_cache[n] = result.keys
    result.keys
  end

  # gonna use bottom up
  def super_frog_hops(n, k)
    if k > n
      frog_cache = super_frog_hops_helper(n, n)
    else
      frog_cache = super_frog_hops_helper(n, k)
    end

    frog_cache[n]
  end

  def super_frog_hops_helper(n, k)
    frog_cache = {
      1 => [[1]],
      2 => [[1, 1], [2]],
      3 => [[1, 1, 1], [1, 2], [2, 1], [3]]
    }
    return frog_cache if n <= 3

    (4..n).each do |i|
      frog_cache[i] = []
      if i <= k
        frog_cache[i] << [k]
      end
      (1..3).each do |j|
        frog_cache[i - j].each do |el1|
          frog_cache[j].each do |el2|
            frog_cache[i] << el1 + el2
          end
        end
      end
      frog_cache[i].uniq!
    end
    frog_cache
  end

  def knapsack(weights, values, capacity)
    check = [weights, capacity]
    return @knapsack_cache[check] unless @knapsack_cache[check].nil?
    # trivial case, when capacity = 0, no possible solution
    return 0 if capacity == 0 || weights.empty?

    if weights[0] > capacity
      # if first item weigh more than the capacity
      # => have to exclude it
      # => recursive call on the rest of weights array
      knapsack(weights[1..-1], values[1..-1], capacity)
    else #if first item weighs less than total capacity
      # include it in the result?
      # => recursive call on the rest, not include it in
      # => but minus its weight from total capacity
      include_item = knapsack(weights[1..-1], values[1..-1], capacity - weights[0])
      # not include it in the result?
      # => doing same thing as above, but dont count its weight toward total capacity
      not_include_item = knapsack(weights[1..-1], values[1..-1], capacity)
      @knapsack_cache[check] = [include_item + values[0], not_include_item].max
    end
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
