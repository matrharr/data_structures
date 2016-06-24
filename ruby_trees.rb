class Node
  attr_accessor :value, :left_child, :right_child
  def initialize(val)
    @value = val
    @left_child = nil
    @right_child = nil
  end
end



class Tree
  def initialize
    @root = nil
    @size = 0
    @storage = []
  end

  def insert(val)
    # checking if the tree is empty
    if @root == nil
      @root = Node.new(val)
    else

      def find_and_insert(current_node, val)
        # checking if inserted node is high or low than root
        if current_node.value > val

          if current_node.left_child == nil
            current_node.left_child = Node.new(val)
          else
            find_and_insert(current_node.left_child, val)
          end

        elsif current_node.value < val

          if current_node.right_child == nil
            current_node.right_child = Node.new(val)
          else
            find_and_insert(current_node.right_child, val)
          end

        end
      end
      find_and_insert(@root, val)
      @size += 1
    end
  end

  def search(target)
    check = false

    def traverse(current_node, target)
      #2 base cases
      if current_node == nil
        return
      elsif current_node.value == target
        p "3"
        check = true
        p check
        return
      end

      #2 recursive cases
      if current_node.value < target
        p "1"
        traverse(current_node.right_child, target)
      elsif current_node.value > target
        p "2"
        traverse(current_node.left_child, target)
      end
    end

    traverse(@root, target)
    check
  end


  def remove(delete_val)

    def round_up(current_node, target)

      if current_node == nil
        return
      end

      if current_node.value != value
        p "1"
        @storage << current_node.value
      end

      round_up(current_node.left_child, target)
      round_up(current_node.right_child, target)
    end

    round_up(@root, delete_val)

    # @root = nil
    # @size = 0
    #   @storage.each do |val|
    #     p "test"
    #   end

    return storage
  end
end

tree = Tree.new
tree.insert(1)
tree.insert(3)
tree.insert(2)
# p tree.search(10)
p tree.remove(3)
p tree







# def search(val)
#   @value = val

#   def traverse(current)
#     return false if current == nil
#     return true if current.val == @value
#     return traverse(current.left_child) || traverse(current.right_child)
#   end

#   return traverse(@root)
# end
