arr = Array.new(9)

stack1 = arr.size/3
stack2 = arr.size/2
stack3 = arr.size - 1

class FixedMultiStack

  def initialize(stack_size)
    n_of_stacks = 3
    @array = Array.new(stack_size * n_of_stacks)

  end




end

class Array

  def special_push(stack, val)
    self.insert(stack, val)
    stack1 = self.size/3
    stack2 = self.size/2
    stack3 = self.size - 1
  end

  def special_pop(stack)
    if self.size < 1
      puts "error"
    else
      self.delete_at(stack)
      stack1 = self.size/3
      stack2 = self.size/2
      stack3 = self.size - 1
    end
  end
end

arr.special_push(stack1, 1)
arr.special_push(stack2, 2)
arr.special_push(stack3, 3)
p arr
