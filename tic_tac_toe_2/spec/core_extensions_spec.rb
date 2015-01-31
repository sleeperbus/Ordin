# spec/core_extensions_spec.rb 
require "spec_helper"
describe Array do 
	context "#all_empty?" do 
		it "returns true when there is no elements." do 
			expect([].all_empty?).to be true
		end

		it "returns true if all the elements of the Array are empty" do 
			expect(["", "", ""].all_empty?).to be true
		end

		it "returns false when some elements have a value" do 
			expect(["", "A", ""].all_empty?).to be false
		end
	end

	context "#any_empty?" do 
		it "returns false if the Array has no member" do 
			expect([].any_empty?).to be false
		end

		it "returns true if there are some empty value" do 
			expect(["A", :x, ""].any_empty?).to be true
		end

		it "returns false when all the elements of the Array has value" do 
			expect([:A, "B", 3].any_empty?).to be false
		end
	end

	context "#all_same?" do 
		it "returns true if the Array is empty" do 
			expect([].all_same?).to be true
		end

		it "returns true if all the elements of the Array are same" do 
			expect(["A", "A", "A"].all_same?).to be true
		end

		it "returns false if any vlaue are different." do 
			expect(["A", "B", "A"].all_same?).to be false			
		end
	end
end
