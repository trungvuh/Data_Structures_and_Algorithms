# well formed string

{
  [ => ]
  { => }
  ( => )
}



([][])
([[ )]]){()}
three seperate 'queue', one for curly braces, one for square brackets, one for parenthesis;

you go through the string...and lets say you see a [

that gets put into the queue

the next time that you see a ]

then that first thing will get removed from the queue

you cant dequeue the [ if one of the other queues

helper_queue:
),],]


# single element in the array of pair elements
# 1,1,2,2,5,5,7,9,9

def single_in_sorted(arr)
  lo = 0
  hi = arr.length - 1
  # stopping condition is when our window has closed
  while lo < hi
    # cutting the array in half
    mid = ((hi - lo) / 2) + lo
    # returning the item if it doesn't have a pair nearby
    return arr[mid] if arr[mid] != arr[mid-1] && arr[mid] != arr[mid+1]
    # if the index is odd and there is a pair below,
    # then the single element is above us
    # if index is even and the pair is above, same;
    # otherwise, the single element is below us
    if (arr[mid] == arr[mid-1] && mid.odd?) ||
      (arr[mid] == arr[mid+1] && mid.even?)
      lo = mid + 1
    else
      hi = mid - 1
    end
  end
  # if we haven't returned yet, then the single
  # element is at the index we closed over
  arr[lo]
end
