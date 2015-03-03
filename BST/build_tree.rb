require_relative("./node.rb")

def build_tree(arr)
	root = Node.new(arr[0])
	arr.each_with_index do |element, idx|
		if idx == 0
			next
		end
		new_node = Node.new(element)
		next_node = root	
		if new_node.value < next_node.value 

	end
end