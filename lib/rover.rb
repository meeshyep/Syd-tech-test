class Rover
    
    COMPASS = ['N', 'E', 'S', 'W']
    
    attr_accessor = :x_coordinate, :y_coordinate, :direction 
    
    def initialize(x, y, direction)
        @x_coordinate = x
        @y_coordinate = y
        @direction = direction
    end
    
    def give_instructions_to_rover(letter)
     case letter
        when "M" then move
        when "R", "L" then turn(letter)
        else raise "Direction provided is invalid"
     end
    end
    
    def turn(letter)
     if letter == "R"
      turn_to = (COMPASS.index(@direction) + 1) % 4
      @direction = COMPASS[turn_to]
     elsif letter == "L"
      turn_to = (COMPASS.index(@direction) - 1) % 4
      @direction = COMPASS[turn_to]
     end
    end
    
    def move
     case @direction
       when "N" then @y_coordinate += 1
       when "E" then @x_coordinate += 1
       when "S" then @y_coordinate -= 1
       when "W" then @x_coordinate -= 1
     end
    end
    
    def state_coordinates_and_direction
     "#{@x_coordinate}, #{@y_coordinate}, pointing #{@direction}"
    end
    
end 