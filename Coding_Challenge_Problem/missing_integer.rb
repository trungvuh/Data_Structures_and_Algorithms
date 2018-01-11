# Write a function:
#
# def solution(a)
#
# that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.
#
# For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.
#
# Given A = [1, 2, 3], the function should return 4.
#
# Given A = [−1, −3], the function should return 1.
#
# Assume that:
#
# N is an integer within the range [1..100,000];
# each element of array A is an integer within the range [−1,000,000..1,000,000].
# Complexity:
#
# expected worst-case time complexity is O(N);
# expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).


def solution(a)
  max = 1
  a.each do |el|
    max = el if el > max
  end

  check = Array.new(max) { false }
  a.each do |num|
    if num <= 0
      next
    else
      check[num - 1] = true
    end
  end

  min_idx = check.index(false)

  if min_idx
    min_idx + 1
  else
    max + 1
  end
end
