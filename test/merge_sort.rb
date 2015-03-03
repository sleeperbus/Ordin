def merge_sort(arr)
  return arr if (0..1).include? arr.length
  a, b = arr.each_slice((arr.length/2.0).round).to_a
  result = []
  x = merge_sort(a)
  y = merge_sort(b)
  until (x.length == 0 or y.length == 0) do
    result << (x[0] <= y[0] ? x.shift : y.shift)
  end
  result += (x + y)
  return result
end

x = 10.times.map { rand(100) + 1 }
puts "x: #{x.join(' ')}"
puts "x: #{merge_sort(x).join(' ')}"