#  1a. What are the three recursive architectual patterns covered? helper, side effects, pure




#  1b. List the 5 steps for Helper Method Recursion?
# instantiate vars, return results, helper method, base case, recursive case



#  1c. Should the recursive case or base case typically be tackled first?
# base case




#  2. Print each item in an array in order using Helper Method of Recursion
#  Input: Array
#  Output: Undefined
# function print(arr){

# }
#  Example: print([1,2,3]) =>
#  1
#  2
#  3

# def print_in_order(arr)

#   def print(arr)
#     if arr.length < 1
#       return
#     else
#       p arr[0]
#       print(arr[1..-1])
#     end

#   end

#   print(arr)
# end

# p print_in_order([1,2,3])



#  3. Print each item in an array backwards using Helper Method of Recursion
#  Input: Array
#  Output: Undefined
# function reversePrint(arr){

# }
#  Example: reversePrint([1,2,3]) =>
#  3
#  2
#  1

# def reverse_print(arr)

#   def print(arr)
#     if arr.length < 1
#       return
#     else
#       p arr[-1]
#       print(arr[0..-2])
#     end

#   end

#   print(arr)
# end

# p reverse_print([1,2,3])



#  4. Reverse a string using Helper Method of Recursion
#  Input: String with no spaces
#  Output: String
# function reverseString(str){

# }
#  Example: reverseString('hello') => 'olleh'
# def reverse_string(str)
#   answer = ''
#     def backwards(string, answer)
#       if string.length < 1
#         return
#       else
#         answer << string[-1]
#         backwards(string[0..-2], answer)
#       end
#     end

#   backwards(str, answer)
#   return answer
# end





#  5. Create tuples from an array using the Helper Method of Recursion
#  Input: Array of integers
#  Output: Array of tuples
# function tuples(arr){

# }
#  Example: tuples([1, 2, 3, 4, 5, 6]) => [[1,2], [3,4], [5,6]]
#  Example: tuples([1, 2, 3, 4, 5]) => [[1,2], [3,4], [5, undefined]]

# def tuples(arr)
#   ans_arr = []

#   def make_tups(arr, ans_arr)
#     if arr.length < 1

#       return
#     else
#       if arr.length == 1
#         ans_arr << [arr[0], nil]
#       else
#         ans_arr << [arr[0], arr[1]]
#         make_tups(arr[2..-1], ans_arr)
#       end
#     end

#   end

#   make_tups(arr, ans_arr)
#   return ans_arr
# end

# p tuples([1,2,3,4,5,6])


#  6. Flatten a nested array using the Helper Method of Recursion
#  Input: Array of integers and arrays
#  Output: Array of integers
# function flatten(arr){

# }
#  Example: flatten([1, [2, 3, [4]], 5, [[6]]]) => [1, 2, 3, 4, 5, 6]

# def flatten(arr)
#   answer = []


#   def recursive_flatten(arr, answer)
#     if arr.length < 1
#       return
#     else
#       i = 0
#       while i < arr.length
#         if arr[i].class == Array
#           recursive_flatten(arr[i], answer)
#         else
#           answer << arr[i]
#         end
#         i += 1
#       end
#     end

#   end


#   recursive_flatten(arr, answer)
#   return answer
# end

# p flatten([1, [2, 3, [4]], 5, [[6]]])

#  7. Power using Helper Method of Recursion
#  Input: Two Integers, Base and Exponent
#  Output: Integer of result
# function power(base, exponent){

# }
#  Example: power(3, 4) => 81

def power(base, exponent)
  answer = 1


  def recursive_power(base, exponent, answer)

    if exponent < 1
      return answer
    else
      answer *= base
      recursive_power(base, (exponent-1), answer)
    end
  end

  recursive_power(base, exponent, answer)
end

p power(3, 4)

#  8. Merge two sorted array using the Helper Method of Recursion
#  Input: 2 Sorted Arrays
#  Output: Sorted Array
# function merge(array1, array2){

# }

# def merge(arr1, arr2)
#   sorted_arr = []

#   def recurse_arr(arr1, arr2, sorted_arr)

#     if arr1.empty?
#       arr2.each{|x| sorted_arr << x}
#     elsif arr2.empty?
#       arr1.each{|x| sorted_arr << x}
#     elsif arr1[0] > arr2[0]
#       sorted_arr << arr2[0]
#       recurse_arr(arr1, arr2[1..-1], sorted_arr)
#     elsif arr1[0] <= arr2[0]
#       sorted_arr << arr1[0]
#       recurse_arr(arr1[1..-1], arr2, sorted_arr)
#     end

#   end

#   recurse_arr(arr1, arr2, sorted_arr)
#   return sorted_arr
# end

# p merge([1,3,5,7,9], [2,4,6,8])

#  9. Redo Flatten from problem 6 using the Recursion w/ Side Effects
#  Input: Array of integers and arrays
#  Output: Array of integers
# function flatten2(arr){

# }
#  Example: flatten([1, [2, 3, [4]], 5, [[6]]]) => [1, 2, 3, 4, 5, 6]

#  10. Redo Flatten from problem 6 using the Pure Recursion
#  Input: Array of integers and arrays
#  Output: Array of integers
# function flatten3(arr){

# }
#  Example: flatten([1, [2, 3, [4]], 5, [[6]]]) => [1, 2, 3, 4, 5, 6]