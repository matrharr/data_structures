class Node
  attr_accessor :val, :rightChild, :leftChild

  def initialize(args={})
    @val = args.fetch(:val, 0)
    @rightChild = args.fetch(:rightChild, nil)
    @leftChild = args.fetch(:leftChild, nil)
  end

end

class Binary_Search_Tree

  def initialize
    @root = nil
    @size = 0
  end

  def insert(val)
    #if less, falls to the left
    #if greater, falls to right
    if @root == nil
      @root = Node.new({val: val})
      @size += 1
    else
      def find_and_insert(curr_node)
        if val > curr_node.val
          #belongs in rightchild
          if curr_node.rightChild == nil
            curr_node.rightChild = Node.new({val:val})
          else
            find_and_insert(curr_node.rightChild)
          end
        elsif val < curr_node.val
          #belongs in leftchild
          if curr_node.leftChild == nil
            curr_node.leftChild = Node.new({val:val})
          else
            find_and_insert(curr_node.leftChild)
          end
        end
      end
      find_and_insert(@root)
      @size += 1
    end
  end

  def search(target)
    check = false

    def traverse(curr_node)
      if curr_node == nil
        return
      elsif curr_node.val == target
        check = true
        return
      end

      if target > curr_node.val
        traverse(curr_node.rightChild)
      elsif target < curr_node.val
        traverse(curr_node.leftChild)
      end
    end

    traverse(@root)
    return check
  end

end