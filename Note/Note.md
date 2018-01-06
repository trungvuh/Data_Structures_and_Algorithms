# Note

**Abbreviation**
  + TC = Time Complexity
  + SC = Space Complexity

**Sort:**

  - **Merge Sort:**
    + TC: O(nlogn) always.
    + SC: O(n) because it has to store the memory of all the other sub-sorted array.
    + Stable, better in caching.

  - **Heap Sort:**
    + TC: O(nlogn) always.
    + SC: O(1), since in-place.
    + Unstable, bad for caching. Best use when having limited space in memory, since its SC is O(1).

  - **Quick Sort:**
    + TC: Best case is O(nlogn) for, worst case O(n^2). Quick Sort is highly depended on the selection of key/ pivot point, but amortized out to O(nlogn)
    + SC: In-place Quick Sort is O(logn) for best case, and O(n) for worst case, when the array is sorted and we need n stack frames for the recursive call.
    + Unstable (for in-place), Stable for naive.
    + Why Quick Sort is better: because in the consideration of nlogn time, we ignore a lot of other coefficient, so in real practice, even though they are both O(nlogn), Quick Sort produces "better" O(nlogn) than Merge Sort produces.

**Length vs. Count:** count is an enumerable, while length is actually constant time.

**Heap**: anytime we need to deal with min and max queue. And because heap is log(n) time, whereas other finding min-max will result in linear time complexity. When the subset that we wanna merge is already sorted, then using heap the heap
