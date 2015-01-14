def stock_picker(prices) 
  max = 0
  max_buy_index = 0
  max_sell_index = 0
  for i in 0 .. (prices.size - 1)
		buy = prices[i] 
#		puts "buy : #{buy}"
		for j in (i+1) .. (prices.size - 1)
		  sell = prices[j] 
#		  puts "sell : #{sell}"
		  profit = sell - buy
		  if profit > max 
				max = profit 
				max_buy_index = i 
				max_sell_index = j
		  end
		end
  end
  result = []
  result << max_buy_index
  result << max_sell_index
end

puts stock_picker([17,3,6,9,15,8,6,1,10])