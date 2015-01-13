def caesar_chiper(stmt, shift=0)
	smalls = ("a".."z").to_a
	if shift <= 0
		en_arr = smalls.collect do |c|
			idx = smalls.index(c)
			idx = idx - shift
			smalls[idx]
		end
	else
		en_arr = smalls.collect do |c|
			idx = smalls.index(c) 
			idx = idx + shift
			if idx > (smalls.size - 1)
				idx = idx - smalls.size
			end
			smalls[idx]
		end
	end
	
	result = stmt.split("").collect do |c| 
		if smalls.include? c.downcase 
			t = en_arr[smalls.index(c.downcase)]
			if is_upper_case? c 
				t.upcase
			else
				t
			end
		else 
			c
		end
	end
	result = result.join("")
end

def is_upper_case? c 
	return c == c.upcase
end

puts caesar_chiper("What a string!", 5)

