class DynamicProgramming

  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
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
    return frog_cache[n] if n <= 3

    
  end

  def frog_hops_top_down(n)

  end

  def frog_hops_top_down_helper(n)

  end

  def super_frog_hops(n, k)

  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
