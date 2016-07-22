def true_shuffle(arr)

  # iterate through arr, randomly selecting element that does not appear before current
  max = arr.length
  i = 0


  while i < max
    rand_val = rand(i..arr.length-1)
    arr[i], arr[rand_val] = arr[rand_val], arr[i]
    i += 1
  end

  arr
end


p true_shuffle([5,3,2,7])