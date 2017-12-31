require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == num_buckets
    unless include?(key)
      self[key].push(key.hash)
      @count += 1
    end
  end

  def remove(key)
    if include?(key)
      self[key].delete(key.hash)
      @count -= 1
    end
  end

  def include?(key)
    self[key].include?(key.hash)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2) { Array.new }

    old_store.each do |bucket|
      bucket.each do |el|
        @store.insert(el)
      end
    end
  end
end
