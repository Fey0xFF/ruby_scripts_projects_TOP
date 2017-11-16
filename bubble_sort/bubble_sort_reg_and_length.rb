#initialize arrays
arraynums = [4,3,78,2,0,2]
arraystrings = ["hi", "hello", "hey"]

#bubble sort
def bubble_sort(array)
  return array.sort! { |item1, item2| item1 <=> item2 }
end


def bubble_sort_by(array)
  return array.sort_by {|item| item.length }
end

#bubble sort the array of numbers
bubble_sort(arraynums)

#bubble sort by length
arraystrings = bubble_sort_by(arraystrings)

#print results
print arraynums
puts ""
print arraystrings
