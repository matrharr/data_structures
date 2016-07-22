def reverse_string(str)

  start = 0
  last = -1

  iterations = str.length/2

  iterations.times do
    str[start], str[last] = str[last], str[start]
    start += 1
    last -= 1
  end

  str
end

# take last letter, prepend

p reverse_string('allthefis')