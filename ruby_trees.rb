class Node
  attr_accessor :value, :left_child, :right_child
  def initialize(val)
    @value = val
    @left_child = nil
    @right_child = nil
  end
end



class Tree
  attr_accessor :root
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
    end
    @size += 1
  end

  def search(target)
    @check = false

    def traverse(current_node, target)
      #2 base cases
      if current_node == nil
        return
      elsif current_node.value == target
        p "3"
        @check = true
        p @check
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
    @check
  end




  def remove(delete_val)
    if !self.search(delete_val)
      puts "Value does not exist"
    else
      @parent_node = @root
      @delete_node = @root


      def hunt_node(current_node, val)

        if current_node.value == val
          @delete_node = current_node
          return
        elsif current_node.value < val
          @parent_node = current_node
          hunt_node(current_node.right_child, val)
        elsif current_node.value > val
          @parent_node = current_node
          hunt_node(current_node.left_child, val)
        end

      end

      hunt_node(@root, delete_val)

      @delete_node_left = @delete_node.left_child
      @delete_node_right = @delete_node.right_child
      to_attach = nil

      if !@delete_node.right_child && !delete_node.left_child
        to_attach = nil
      elsif @delete_node.right_child && !@delete_node.left_child
        to_attach = @delete_node.right_child
      elsif @delete_node.left_child && !@delete_node.right_child
        to_attach = @delete_node.left_child
      elsif @delete_node.left_child && @delete_node.right_child
        to_attach = @delete_node.right_child

        @left_most_node = @delete_node.right_child

        while @left_most_node.left_child != nil
          @left_most_node = @left_most_node.left_child
        end

        @left_most_node.left_child = @delete_node.left_child
      end


      if @parent_node.value < @delete_node.value
          # rightchild equal to attach
          @parent_node.right_child = to_attach
      elsif @parent_node.value > @delete_node.value
          # leftchild equal to attach
          @parent_node.left_child = to_attach
      end

    end

  end

  # def remove(delete_val)

  #   def round_up(current_node, target)

  #     if current_node == nil
  #       return
  #     end

  #     p current_node.value

  #     if current_node.value != target
  #       p "1"
  #       @storage << current_node.value
  #     end

  #     round_up(current_node.left_child, target)
  #     round_up(current_node.right_child, target)
  #   end

  #   round_up(@root, delete_val)

  #   @root = nil
  #   @size = 0

  #   @storage.each do |val|
  #     self.insert(val)
  #   end

  #   return @storage
  # end

end

tree = Tree.new
tree.insert(4)
tree.insert(2)
tree.insert(1)
tree.insert(7)
tree.insert(3)
tree.insert(5)
tree.insert(10)
tree.insert(9)
# tree.insert(8)
# tree.insert(7)
# tree.insert(10)
# tree.insert(6)
# tree.insert(9)
# tree.insert(11)
# p tree.search(3)
tree.remove(7)

p tree.root.right_child


