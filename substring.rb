
# take length of substr
# iterate string
#   - when string[i] == substr[0]
#   - take a slice of string of length substr.length
#   - if equal, true, if not, iterate up to string.       length - substr.length



def find_substring(string, substring)

  sub_len = substring.length
  # 3
  str_len = string.length
  # 5
  i = 0


  (str_len - sub_len).times do
    # 2
    if string[i] == substring[0]
      if string[i..(i+sub_len-1)] == substring
        # sublen -1 because starting on first letter
        return true
      end
    end
    i += 1
  end

  false
end



p find_substring('aabae', 'bat')