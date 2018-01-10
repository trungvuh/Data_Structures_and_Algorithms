## Dynamic Programming

- Top-Down method, often referred to as 'memoization'
- Bottom-Up, uses smaller solutions as the basis of later/ larger solutions.

Longest increasing subsequence

insight: if we have a good answer terminating in one of our element, the final answer must be among them.

```Ruby
def longest_increase_sub(arr)
  longest = Array.new(arr.size) { Array. new }
  longest[0] < arr[0]

  (1...arr.size).each do |i|
    (0...i).each do |j|
      if arr[j] < arrr[j] && longest[i].size < longest[j].size + 1
        longest[i] = longest[j].dup
      end
    end

    longest[i] << arr[i]
  end

  longest.max_by(&:length).length
end
```
