require('yaml')
class Ogre
    def initialize(strength, speed)
        @strength = strength
        @speed = speed
    end
    
    def self.deserialize(yaml_string)
      YAML::load(yaml_string)
    end
    
    def serialize
      YAML::dump(self)
    end
    
    def to_s
      "Ogre: [strength = #{@strength}, speed = #{@speed}"
    end
end