#bubble sort
def bubble_sort(array)
    loop do 
        swaped = false
        (array.size - 1).times do |idx|
            if array[idx] > array[idx+1]
                array[idx], array[idx+1] = array[idx+1], array[idx]
                swaped = true
            end
        end
        break unless swaped
    end
    array
end

def bubble_sort_by(array)
    loop do 
        swaped = false 
        (array.size - 1).times do |idx|
            if yield(array[idx], array[idx+1]) < 0
                array[idx], array[idx+1] = array[idx+1], array[idx]
                swaped = true 
            end
        end
        break unless swaped
    end
    array
end

puts bubble_sort([4,3,78,2,0,2]).join(", ")
puts bubble_sort([6, 5, 4, 3, 2, 1, 7, 8, 9, 10]).join(", ")

x = bubble_sort_by(["hi", "hello", "hey"]) do |left, right|
    right.length - left.length
end
puts x.join(" / ")
