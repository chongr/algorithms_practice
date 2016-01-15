class Array
  def my_min_slow
    self.length.times do |first_i|
      smallest = true
      (first_i...self.length).each do |second_i|
        smallest = false if self[second_i] < self[first_i]
      end
      return self[ first_i ] if smallest
    end
  end

  def my_min_fast
    #gotta go fast
    min = self.first
    self.each do |el|
      min = el if el < min
    end
    min

  end

end

def largest_contiguous_subsum_slow(list)
  all_subarrays = []
  list.length.times do |i|
    (i...list.length).each do |j|
      all_subarrays << list[i..j]
    end
  end

  max_sum = list.first
  max_sum_index = 0

  p all_subarrays
  all_subarrays.each_with_index do |subarray, i|
    current_sum = subarray.inject(:+)
    if current_sum > max_sum
      max_sum = current_sum
      max_sum_index = i
    end
  end

  max_sum
end

# def largest_contiguous_subsum_fast(list)
#   sum = 0
#   max_sum = 0
#   max_sum_idx = 0
#
#   list.length.times do |idx|
#     sum += list[idx]
#     p "sum: #{sum}"
#     if sum > max_sum
#       max_sum = sum
#       max_sum_idx = idx
#     end
#   end
#
#   sum = max_sum
#
#   (max_sum_idx + 1).times do |idx|
#     p idx
#     sum -= list[idx]
#     if sum > max_sum
#       max_sum = sum
#     end
#   end
#
#   max_sum
# end

def largest_contiguous_subsum_fast( list )
  current_contiguous_sum = 0
  max_sum = list.first

  list.each do |el|
    current_contiguous_sum += el

    if max_sum < current_contiguous_sum
      max_sum = current_contiguous_sum
    end

    if el > current_contiguous_sum
      current_contiguous_sum = el
    end

  end

  max_sum
end
def anagram_one?( first, second )
  first = first.split("")
  second = second.split("")

  return false if first.length != second.length

  permutations = first.permutation.to_a.uniq

  permutations.include?( second )
end

def anagram_two?( first, second )
  first = first.split("")
  second = second.split("")

  return false if first.length != second.length

  first.each do |ltr|
    loc = second.index(ltr)
    second.delete_at(loc) if loc
  end

  return true if second.empty?

  false
end

def anagram_three?(first, second)
  first = first.split("")
  second = second.split("")

  first.sort!
  second.sort!

  first == second
end

def anagram_four?(first, second)
  letter_hash = Hash.new(0)
  first = first.split("")
  second = second.split("")

  first.each do |let|
    letter_hash[let] += 1
  end

  second.each do |let|
    letter_hash[let] -= 1
  end

  letter_hash.each do |key, value|
    return false if !value.zero?
  end

  true
end

def bad_two_sum?(arr, target)
  arr.length.times do |idx1|
    ((idx1+1)...arr.length).each do |idx2|
      p " #{idx1} #{idx2}"
      return true if arr[idx1] + arr[idx2] == target
    end
  end
  false
end

def okay_two_sum(arr, target)
  arr.sort!

  arr.each do |num|
    search_target = target - num
    p "search target: #{search_target} ----------- num: #{num} ----------"
    return true if arr.bsearch { |x| x >= search_target }
  end

  false
end

def good_two_sum(arr, target)
  memory_hog = {}

  arr.each do |num|
    memory_hog[ num ] = true
  end

  arr.each do |num|
    search_target = target - num
    if memory_hog[ search_target ] && search_target != num
      p "target #{target} found, via #{num} and #{search_target}"
      return true
    end
  end

  false
end

def four_sum( arr, target )
  target.times do |x|
    a = x + 1
    b = target - a
    if good_two_sum( arr, a ) && good_two_sum( arr, b )
      p "four sum found. a: #{a} b: #{b}"
      return true
    end
  end
  false
end

def max_windowed(array, window_size)
  current_max_range = nil
  i = 0

  while i <= array.length - window_size
    window = array[i...(i+window_size)]
    p window
    window_max = window.max
    window_min = window.min
    window_range = window_max - window_min

    current_max_range = window_range if current_max_range.nil? || window_range > current_max_range

    i += 1
  end

  current_max_range
end
