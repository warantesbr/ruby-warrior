module RubyWarrior
  class Floor
    attr_accessor :width, :height, :grid
    attr_reader :stairs_location
    
    def initialize(width, height)
      @width = width
      @height = height
      @units = []
      @stairs_location = nil
    end
    
    def add(unit, x, y, direction = nil)
      @units << unit
      unit.position = Position.new(self, x, y, direction)
    end
    
    def place_stairs(x, y)
      @stairs_location = [x, y]
    end
    
    def units
      @units.reject { |u| u.position.nil? }
    end
    
    def get(x, y)
      units.detect do |unit|
        unit.position.at?(x, y)
      end
    end
    
    def space(x, y)
      Space.new(self, x, y)
    end
    
    def out_of_bounds?(x, y)
      x < 0 || y < 0 || x > @width-1 || y > @height-1
    end
  end
end
