def do_with_array(array)
    array.each do |el|
        yield el
    end
end

def total(prices)
    result = 0
    do_with_array(prices) do |price|
        result += price
    end
    return result
end

def minus(prices)
    result = 0
    do_with_array(prices) do |price|
        result -= price
    end
    return result
end

puts total([1, 2, 3, 4, 5])
puts minus([1, 2, 3, 4, 5])