class Queue

  attr_reader :store

  def initialize
    @store = Array.new
  end

  def enqueue(val)
    @store.unshift(val)
  end

  def dequeue
    @store.pop
  end

  def peek
    @store[-1]
  end

end