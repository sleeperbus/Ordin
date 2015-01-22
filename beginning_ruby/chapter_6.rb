

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


module UsefulFeatures
    def class_name
        self.class.to_s
    end
end

class Person
    include UsefulFeatures
end

class AllVowels
   include Enumerable

    @@vowels = %w{a e i o u}
    def each 
        @@vowels.each { |v| yield v }
    end
end

class Song
    include Comparable

    attr_accessor :length

    def <=>(other)
        @length <=> other.length
    end


    def initialize(song_name, length)
        @song_name = song_name
        @length = length
    end
end





