#
# Your previous JavaScript content is preserved below:
#
# /*********************************************************************
#  *                           Sprint IV                               *
#  *                                                                   *
#  *                        Traversals Pt. 1                           *
#  *                                                                   *
#  *  Instructions: One of the most fundamental components of working  *
#  *                with trees and graphs is traversals.  We will      *
#  *                focus primarily on this piece to build your        *
#  *                foundation of these data structures.               *
#  *                                                                   *
#  *********************************************************************/
#
# /*** First we need a binary search tree.  Use an existing binary search tree class that you have built. ***/
class Node
  attr_accessor :val, :rightChild, :leftChild

  def initialize(args={})
    @val = args.fetch(:val, 0)
    @rightChild = args.fetch(:rightChild, nil)
    @leftChild = args.fetch(:leftChild, nil)
  end

end

class Binary_Search_Tree

  attr_reader :root

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

      def find_and_insert(curr_node, val)
        if val > curr_node.val
          #belongs in rightchild
          if curr_node.rightChild == nil
            curr_node.rightChild = Node.new({val:val})
          else
            find_and_insert(curr_node.rightChild, val)
          end
        elsif val < curr_node.val
          #belongs in leftchild
          if curr_node.leftChild == nil
            curr_node.leftChild = Node.new({val:val})
          else
            find_and_insert(curr_node.leftChild, val)
          end
        end
      end
      find_and_insert(@root, val)
      @size += 1
    end
  end

  def search(target)
    check = false

    def traverse(curr_node, target)
      if curr_node == nil
        return
      elsif curr_node.val == target
        check = true
        return
      end

      if target > curr_node.val

        traverse(curr_node.rightChild, target)
      elsif target < curr_node.val

        traverse(curr_node.leftChild, target)
      end

    end

    traverse(@root, target)
    return check
  end

  def insertArr(arr)

    arr.each do |value|
      self.insert(value)
    end
  end

end


a = Binary_Search_Tree.new
b = [4,2,5,1,3,7,6,8]
a.insertArr(b);
# p a.root


#
#
#
# /**
#  *  1. Write a function that takes in an array of integers and performs the insert method on each
#  *     item of the array in order.
#  *
#  *  Input: Array
#  *  Output: Binary Search Tree
#  *
#  *  Example: [4, 2, 5, 1, 3, 7, 6, 8]
#  *  Output this binary search tree:
#  *
#  *              4
#  *            /   \
#  *          2       5
#  *        /   \       \
#  *      1       3       7
#  *                    /   \
#  *                  6      8
#  **/
# Pre-order: 4,2,1,3,5,7,6,8
# In-order: 1, 2, 3, 4, 5, 6, 7, 8
# Post-Order: 1, 3, 2, 6, 8, 7, 5, 4
# /**
#  *  2. Given the example output binary search tree from Problem 1, what would the order of values
#  *     printed be if we used:
#  *
#  *     a. BREADTH FIRST traversal
#  *
#  *     b. PRE-ORDER DEPTH first traversal
#  *
#  *     c. IN-ORDER DEPTH first traversal
#  *
#  *     d. POST-ORDER DEPTH first traversal
#  **/
#
#
# /**
#  *  3a. Using a queue, and while loop write a function that takes in a binary search tree and
#  *      outputs an array of values ordered by BREADTH FIRST traversal.
#  *
#  *  Input: Binary Search Tree
#  *  Output: Array
#  *
#  *  NOTE: You may use an array or linked list for your queue.
#  *
#  *  NOTE: Confirm with your answer from problem 2a.
#  **/

def breadth_first(tree)
  position = [tree.root]
  val = []

  while position.length != 0
    temp = position.shift
    val.push(temp.val)
    if(temp.leftChild)
      position.push(temp.leftChild)
    end

    if(temp.rightChild)
      position.push(temp.rightChild)
    end

  end

  val
end

p breadth_first(a)

# /**
#  *  3b. Using recursion, write a function that takes in a binary search tree and
#  *      outputs an array of values ordered by PRE-ORDER DEPTH FIRST traversal.
#  *
#  *      Input: Binary Search Tree
#  *      Output: Array
#  *
#  *      NOTE: Confirm with your answer from problem 2b.
#  **/
#
def pre_order_traversal(tree)
    check = []

    def traverse(curr_node, check)

        return if curr_node == nil
        # placement of this push
        # defines pre/post/in order traversal
        check << curr_node.val
        ####
        traverse(curr_node.leftChild, check)
        traverse(curr_node.rightChild, check)

    end

    traverse(tree.root, check)

    check
end

p pre_order_traversal(a)
#
# /**
#  *  3c. Using recursion, write a function that takes in a binary search tree and
#  *      outputs an array of values ordered by IN-ORDER DEPTH FIRST traversal.
#  *
#  *      Input: Binary Search Tree
#  *      Output: Array
#  *
#  *      NOTE: Confirm with your answer from problem 2c.
#  **/
#
#
# /**
#  *  3d. Using recursion, write a function that takes in a binary search tree and
#  *      outputs an array of values ordered by POST-ORDER DEPTH FIRST traversal.
#  *
#  *      Input: Binary Search Tree
#  *      Output: Array
#  *
#  *      NOTE: Confirm with your answer from problem 2d.
#  **/
#
#
