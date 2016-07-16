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
    @storage.pop
    @size -= 1
  end

  def peek
    @storage[-1]
  end

end


 # this is fucked up
class Stack

  attr_accessor :size, :storage

  def initialize
    @size = 0
    @storage = Array.new
  end

  def is_empty?
    if @size < 1
      return true
    end
    false
  end

  def pop
    if is_empty?
      puts "The stack is empty, push something first."
    else
      @storage.pop
      @size -= 1
    end
  end

  def push(val)
    @storage.push(val)
    @size += 1
  end

  def peek
    @storage[-1]
  end

end



class QueueofStacks

  def initialize
    @stack1 = Array.new
    @stack2 = Array.new
  end

  def enqueue(val)
    if @stack2.size > 0
      until @stack2.size == 0
        @stack1.push(@stack2.pop)
      end
    end

    @stack1.push(val)
  end

  def dequeue
    until @stack1.size == 1
      @stack2 << @stack1.pop
    end
    @stack1.pop
  end

end


q = QueueofStacks.new

q.enqueue(1)
q.enqueue(2)
q.enqueue(3)

p q.dequeue



