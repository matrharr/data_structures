def quickSort(input)
  if input.length <= 1
    return input
  end

  pivot_index = work.length/2.floor
  pivot = work[pivot_index]

  before = []
  after = []

  i = 0
  while i < work.length
    if i != pivot_index
      if work[i] <= pivot
        before << work[i]
      else
        after << work[i]
      end
    end
  end

  return quickSort(before) + pivot + quickSort(after)

end



def quicksort_in_place(arr)
  #arr[0] = mid
  #arr[-1] = pivot
  #mid moves until it is higher than pivot
  #mid swaps with all values lower than pivot

  def place_pivot(arr, start, fin)
    if start >= fin
      return
    end
    mid = start
    for i in (start..fin)
      if arr[i] < arr[fin]
        arr[mid], arr[i] = arr[i], arr[mid]
        mid += 1
        #swap mid with current i
        #increment mid
      end
    end
    arr[fin], arr[mid] = arr[mid], arr[fin]
    place_pivot(arr, start, mid-1)
    place_pivot(arr, mid+1, fin)
  end

  place_pivot(0, arr.length-1)
  return arr

end