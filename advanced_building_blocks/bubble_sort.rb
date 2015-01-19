#bubble sort
def bubble_sort(array)
    loop do 
        swaped = false
        (array.size - 1).times do |idx|
            puts "idx: #{idx}"
            if array[idx] > array[idx+1]
                array[idx], array[idx+1] = array[idx+1], array[idx]
                swaped = true
            end
        end
        break unless swaped
    end
    array
end

puts bubble_sort([4,3,78,2,0,2])
puts bubble_sort([6, 5, 4, 3, 2, 1, 7, 8, 9, 10])
