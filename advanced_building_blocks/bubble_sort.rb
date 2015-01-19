#bubble sort
def bubble_sort(array)
    for i in 0 .. (array.size - 1)
        for j in 0 .. (array.size - 2)
            if array[j] > array[j+1]
                array[j], array[j+1] = array[j+1], array[j]
            end
        end 
    end
    array
end

puts bubble_sort([4,3,78,2,0,2])
puts bubble_sort([6, 5, 4, 3, 2, 1, 7, 8, 9, 10])
