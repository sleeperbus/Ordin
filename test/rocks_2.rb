def rock_judger(rocks_arr)
  count = rocks_arr.length 
  a, b = count <= 2 ? [rocks_arr[0], rocks_arr[-1]] : 
                      [rock_judger(rocks_arr.pop(count/2)), rock_judger(rocks_arr)]
  return a > b ? a : b
end

rocks = 30.times.map { rand(200) + 1 }
puts rocks.join(", ")
puts "Heaviest rock is: #{rock_judger(rocks)}"