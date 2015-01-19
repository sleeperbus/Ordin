#bubble sort
def bubble_sort(array)
    array.each_with_index do |num, idx|
        max = idx
        for i in idx+1 .. array.size - 1
            if array[idx] > array[i]
                max = i
            end
        end
        if max != idx
            array[idx], array[max] = array[max], array[idx]
        end
        puts array.join(", ")
    end
    array
end

puts bubble_sort([4,3,78,2,0,2])
