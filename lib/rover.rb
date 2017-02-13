class Rover
    
    COMPASS = ['N', 'E', 'S', 'W']
    
    attr_accessor = :x_coordinate, :y_coordinate 
    
    def initialize(x, y, direction)
        @x_coordinate = x
        @y_coordinate = y
        @direction = direction
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