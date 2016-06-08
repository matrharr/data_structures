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
