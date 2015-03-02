def fib(num, result = [])
	(0..num).map do |n|
		if (0..1).include? n
			result << n
		else
			result << (result[n - 1].to_i + result[n - 2].to_i)
		end
	end
	result
end

puts fib(14).join(" ")