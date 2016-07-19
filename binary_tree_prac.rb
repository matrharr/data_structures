class Node
  attr_accessor :value, :right_child, :left_child

  def initialize(val)
    @value = val
    @right_child = nil
    @left_child = nil
  end

end


class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end


  def bt_insert(val)
    @new_node = Node.new(val)

    if @root == nil
      @root = @new_node
    else

      def insert(current_node)
        if current_node.value < @new_node.value
          if current_node.right_child == nil
            current_node.right_child = @new_node
          else
            insert(current_node.right_child)
          end
        elsif current_node.value > @new_node.value
          if current_node.left_child == nil
            current_node.left_child = @new_node
            p current_node.left_child
          else
            insert(current_node.left_child)
          end
        end
      end

      return insert(@root)
    end

  end
end

b = BinaryTree.new
b.bt_insert(5)
b.bt_insert(4)
b.bt_insert(7)
b.bt_insert(3)
p b