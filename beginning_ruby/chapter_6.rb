class Square
    def initialize
        @@number_of_squares = defined?(@@number_of_squares) ? @@number_of_squares + 1 : 1
    end 
    
    def Square.count 
        @@number_of_squares
    end
end

class Person
    def initialize(name)
        @name = name
    end
    
    def name 
        @name
    end
end

class Doctor < Person
    def name 
        "Dr." + super
    end
end


# overriding
class Dog
    def talk
        puts "Woof!"
    end
end

class Dog 
    def talk
        puts "Howl!"
    end
end