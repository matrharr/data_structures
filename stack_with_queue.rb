class Queue

  attr_accessor :size, :storage

  def initialize
    @size = 0
    @storage = Array.new
  end

  def enqueue(val)
    @storage.unshift(val)
    @size += 1
  end

  def dequeue
    if @size < 1
      puts "Error"
    else
      @size -= 1
      @storage.pop
    end
  end

  def peek
    @storage[-1]
  end

end


class StackFromQueue
  def initialize
    @size = 0
    @storage = Queue.new
  end

  def push(val)
    @storage.enqueue(val)
    @size += 1
  end

  def pop
    if @size < 1
      puts "error"
    else
      (@size-1).times do
        @storage.enqueue(@storage.dequeue)
      end
      @size -= 1
      @storage.dequeue
    end
  end

end

a = StackFromQueue.new
a.pop
a.push(1)
a.push(2)
a.push(3)

p a.pop
p a.pop
p a