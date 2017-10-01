def quick_sort(list)
  qsort_helper(list).flatten
end
 
def qsort_helper(list)
  return [] if list.empty?
 
  number        = list.sample
  lower, higher = list.partition { |n| n < number }
 
  higher.delete_at(higher.index(number))
 
  [qsort_helper(lower), number, qsort_helper(higher)]
end

# data before sorting
p quick_sort [3, 7, 2, 1, 8, 12, 5, 22, 11, 4, 15]

# result 
# [1, 2, 3, 4, 5, 7, 8, 11, 12, 15, 22]




