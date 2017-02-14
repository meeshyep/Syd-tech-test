require_relative './plateau'
require_relative './rover'
require_relative './navigation'

class Nasa_Controller
    
    attr_accessor:plateau, :navigation, :current_rovers

  def create_course_details
    get_navigation
    establishing_plateau
    land_rovers
  end

  def get_navigation
    @navigation= Navigation.new('./lib/instructions.txt')
    @navigation.create_parameters_from_instructions
  end

  def establishing_plateau
    @plateau= Plateau.new(*@navigation.plateau_params)
    puts "The plateau is #{@plateau.max_x} units wide and #{@plateau.max_y} long"
  end

  def land_rovers
    @current_rovers= []
    i= 1
    @navigation.rover_initial_params.each do |params_array|
    new_rover= Rover.new(i,*params_array)
      @current_rovers << new_rover
    puts "Rover id: #{i} has landed at #{params_array}"
    i= i + 1
    end
  end

  def navigate_rovers
    @current_rovers.each_with_index do |rover, index|
    next if rover.moved == true
      send_navigation_to_rover(rover, @navigation.rover_navigation[index], index + 1)
    end
  end

  def send_navigation_to_rover(rover, navigation, number)
    navigation.each do |letter|
        rover_lost(rover)
        if rover.status == "Lost"
          puts "Unable to locate rover # #{number}. We know it was at #{rover.state_coordinates_and_direction}"
          break
        else
          rover.give_instructions_to_rover(letter)
          puts "Rover id: #{number} is at #{rover.state_coordinates_and_direction}"
          #sleep(0.1)
        end
    end
    rover.set_moved_status
  end
  
  def rover_lost(rover)
    if rover.x_coordinate > @plateau.max_x || rover.x_coordinate < 0
      rover.set_rover_status
    elsif rover.y_coordinate > @plateau.max_y || rover.y_coordinate < 0
      rover.set_rover_status
    end
  end

end