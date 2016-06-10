class MinHeap

  def initialize
    @storage = [nil]
  end

  def peak
    @storage[1]
  end

  def size
    @storage.length - 1
  end

  def insert(value)
    @storage << value
    @storage.bubble_up(@storage.size)
  end

  def bubble_up(index)

  end

  def swap(index_a, index_b)
    temp = @storage[index_a]
    @storage[index_a] = @storage[index_b]
    @storage[index_b] = temp
  end

  def pop
    #swap first and last element
    self.swap(1, self.size)
    result = @storage.pop
    self.bubble_down(1)
  end

  def bubble_down(index)
  end

end