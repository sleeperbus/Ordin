# lib/tic_tac_toe_2/core_extensions.rb 
class Array
	def all_empty?
		self.all? { |element| element.to_s.empty? }
	end

	def any_empty?
		self.any? { |element| element.to_s.empty? }
	end

	def all_same?
		self.all? { |element| element == self[0] }
	end
end
