def search(val)
  @value = val

  def traverse(current)
    return false if current == nil
    return true if current.val == @value
    return traverse(current.left_child) || traverse(current.right_child)
  end

  return traverse(@root)
end
