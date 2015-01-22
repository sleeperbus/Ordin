

class Person
    def initialize(name)
        set_name(name)
    end
    
    def name 
        @first_name + " " + @last_name
    end

    private    
    def set_name(name)
        first_name, last_name = name.split(/\s+/)
        set_first_name(first_name)
        set_last_name(last_name)
    end
    
    def set_first_name(name)
        @first_name = name 
    end
    
    def set_last_name(name)
        @last_name = name
    end
end

class Person
    def initialize(age)
        @age = age
    end
    
    def age 
        @age
    end
    
    def age_difference_with(other_person)
        (self.age - other_person.age).abs
    end
    
    protected :age
end

class Animal
    attr_accessor :name 
    
    def initialize(name)
        @name = name
    end  
end

class Cat < Animal
    def talk
        "Meaow!" 
    end
end

class Dog < Animal
    def talk
        "Woof!"
    end
end

#animals = [Cat.new("Flossie"), Dog.new("Clive"), Cat.new("Max")]
#animals.each do |animal|
#    puts animal.talk
#end
