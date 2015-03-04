require_relative("./node.rb")

def build_tree(arr)
	root_node = Node.new(arr[0])
	arr.each_with_index do |element, idx|
		puts element
		if idx == 0
			next
		end
		current_node = root_node 
		new_node = Node.new(element)
		until new_node.root? == false do
			if new_node.value < current_node.value 
				if current_node.left_child.nil?
					new_node.parent = current_node
					current_node.left_child = new_node
				else 
					current_node = current_node.left_child 
				end
			else 
				if current_node.right_child.nil?
					new_node.parent = current_node
					current_node.right_child = new_node
				else
					current_node = current_node.right_child
				end
			end
		end 
	end
	root_node
end