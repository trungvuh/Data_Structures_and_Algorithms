500 Files

have 500 files, each containing the stock trading data. Within each file all the trade have timestamps. Timestamps appear in ascending order. Create one file of all data in ascending time order.


def data
  heap = BinMinHeap.new
  500.times do |i|
    files.each do |file|
      heap.push
    end
  end
end
