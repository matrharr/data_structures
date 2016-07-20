class Node
  attr_accessor :value, :right_child, :left_child

  def initialize(val)
    @value = val
    @right_child = nil
    @left_child = nil
  end

end


class Tree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert_with_breadth(val)
    new_node = Node.new(val)
    queue = []

    if @root == nil
      @root = new_node
    else
      queue << @root

      until queue.length < 1

        if queue[0].left_child # if not nil
          queue.push(queue[0].left_child)
        else
          queue[0].left_child = new_node
          return
        end

        if queue[0].right_child
          queue.push(queue[0].right_child)
        else
          queue[0].right_child = new_node
          return
        end

        queue.shift
      end
    end
  end

  def depth_search(val)
    @value = val
    answer = []

    def traverse(current, arr)
      return false if current == nil
      return true if current.value == @value
      p arr << current.value # placement of this push determines pre/in/post orders. above/inbetween/after recursive cases
      traverse(current.left_child, arr)
      traverse(current.right_child, arr)
    end



    return traverse(@root, answer)
  end


  def balanced_check
    @max_depth = 0
    @counter = 0
    @answer = true

    def traverse(current_node)

      if current_node == nil

        p @counter
        if @counter > @max_depth
          @max_depth = @counter
          @counter = 1
        end

        if (@max_depth - @counter).abs > 1
          @answer = false
        end

        return
      else
        @counter += 1
      end

      # if current_node.left_child || current_node.right_child
      #   @counter += 1
      # end


      traverse(current_node.left_child)
      traverse(current_node.right_child)


    end

    traverse(@root)
    return @answer
  end

end



a = Tree.new
a.insert_with_breadth(5)
a.insert_with_breadth(4)
a.insert_with_breadth(3)
a.insert_with_breadth(2)



# a.root.left_child.left_child.left_child = Node.new(10)
a
p a.balanced_check

