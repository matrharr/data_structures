class Node
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end

end



class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(val)
    new_node = Node.new(val)

    if @size == 0
      @head = new_node
      @tail = new_node
      @size += 1
    else
      @tail.next = new_node
      @tail = @tail.next
      @size += 1
    end
  end

  def insert(insert_val, search_val)
    new_node = Node.new(insert_val)
    current_node = @head
    until current_node == nil
      if current_node.val == search_val
        temp = current_node.next
        current_node.next = new_node
        new_node.next = temp
        @size += 1
        return
      else
        current_node = current_node.next
      end
      puts 'search val not found'
    end

  end

  def search(val)
    current_node = @head
    until current_node == nil
      if current_node.val == val
        return true
      end
      current_node = current_node.next
    end
    puts "node not found"
  end

  def delete(val)
    current_node = @head
    until current_node == nil
      if current_node.val != val
        last_node = current_node
        current_node = current_node.next
      elsif current_node.val == val
        if current_node.val == @head.val
          @head = current_node.next
        elsif current_node.val == @tail.val
          @tail = last_node
          @tail.next = nil
        else
          last_node.next = current_node.next
        end
        @size -= 1
        return
      end
    end
    puts "node not found"
  end

end


a = LinkedList.new

a.append(1)
a.append(2)
a.append(4)
# a.search(4)

a.insert(3,2)

p a