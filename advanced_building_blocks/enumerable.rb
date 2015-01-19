module Enumerable
    def my_each
        for idx in 0..(self.size-1)
            yield self[idx]
        end
        self
    end
    
    def my_each_with_index
        for idx in 0..(self.size-1)
            yield self[idx], idx
        end
        self
    end
    
    def my_select 
        result = []
        self.my_each do |el| 
            if yield(el)
                result << el
            end
        end
        result
    end
    
    def my_all?
        self.my_each do |el|
            return false unless yield(el)
        end
        return true
    end
    
    def my_any?
        self.my_each do |el|
            return true if yield(el) 
        end
        return false
    end
    
    def my_none?
        self.my_each do |el| 
            return false if yield(el)
        end
        return true
    end
    
    def my_count 
        result = 0
        unless block_given?
            result = self.size
        else 
            self.my_each do |el|
                result += 1 if yield(el)
            end
        end
        return result
    end
end
