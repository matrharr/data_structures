class Stack

  attr_reader :store

  def initialize
    @store = Array.new
  end

  def push(val)
    if @store.length == 0
      @store << [val, val]
    elsif @store[-1][1] <= val
      @store << [val, @store[-1][1]]
    else
      @store << [val, val]
    end
  end

  def pop
    @store.pop[0]

  end

  def peek
    @store[-1][0]
  end

  def min
    @store[-1][1]
  end


end