class Node
	attr_accessor :value, :parent, :left_child, :right_child

	def initialize(value, parent=nil, left_child=nil, right_child=nil)
		@value = value
		@parent = parent
		@left_child = left_child
		@right_child = right_child
	end

	def is_leaf?
		(@left_child.nil? and @right_child.nil?) ? true : false 
	end

	def is_root?
		(@parent.nil?) ? true : false
	end
end