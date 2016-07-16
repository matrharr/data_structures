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
      @size -= 1
      @storage.pop
    end
  end

  def push(val)
    @size += 1
    @storage.push(val)
  end

  def peek
    @storage[-1]
  end

end



class QueueofStacks

  def initialize
    @stack1 = Stack.new
    @stack2 = Stack.new
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
      @stack2.push(@stack1.pop)
    end
    @stack1.pop
  end

end


q = QueueofStacks.new

q.enqueue(1)
q.enqueue(2)
q.enqueue(3)

p q.dequeue
p q

