def lattice_paths(n)
  count = 0


  def traverse(x,y, n)
    if x == n && y == n
      count += 1
      return
    elsif x > n || y > n
      return
    end

    traverse(x + 1, y, n)
    traverse(x, y + 1, n)

  end

  traverse(0,0, n)

  return count
end


def lattice_paths_SE(n, x=0, y=0)

  if x == n && y == n
    return 1
  elsif x > n || y > n
    return 0
  end

  return lattice_paths_SE(n, x+1, y) + lattice_paths_SE(n, x, y+1)

end

def lattice_paths_pure(x, y)
  if x == 0 && y == 0
    return 1
  elsif x < 0 || y < 0
    return 0
  end

  return lattice_paths_pure(x-1, y) + lattice_paths_pure(x, y-1)


end