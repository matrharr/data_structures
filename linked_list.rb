class Node

  attr_accessor :value
  attr_accessor :next

  def initialize(val)
    @value = val
    @next = nil
  end

end

class Linked_List

  attr_reader :head
  attr_reader :tail
  attr_reader :listLength

  def initialize()
    @head = nil
    @tail = nil
    @listLength = 0
  end


  def append(val)
    if @listLength == 0
      @head = Node.new(val)
      @tail = @head
    else
      @tail.next = Node.new(val)
      @tail = @tail.next
    end
    @listLength += 1
  end

  def insert(insertVal, searchVal)
    curr_node = @head
    until curr_node == nil
      if curr_node.value == searchVal
        reference = curr_node.next
        curr_node.next = Node.new(insertVal)
        curr_node.next.next = reference

        if reference == nil
          @tail = curr_node.next
        end
        @listLength += 1
      end
      curr_node = curr_node.next
    end
    false
  end

  def delete(location)
    if location == 0 && @listLength == 0
      @head = nil
      @tail = nil
      @listLength -= 1
      return
    elsif location == 0
      @head = @head.next
      @listLength -= 1
      return
    end

    work = @head
    counter = 0

    while work != nil
      if counter == (location-1) && work.next != nil && work.next == @tail
        work.next = work.next.next
        @tail = work
        @listLength -= 1
        return
      elsif counter == location-1 && work.next != nil
        work.next = work.next.next
        @listLength -= 1
        return
      end
      counter += 1
      work = work.next
    end
    false
  end

  def contains(val)
    curr_node = @head
    while curr_node != nil
      if curr_node.value == val
        return true
      end
      curr_node = curr_node.next
    end
    false
  end


end

