require_relative './lib/nasa_controller'

puts "Welcome to the Mars Rover Mission"
puts ""
puts "Loading the instructions from instructions.txt"
mission = Nasa_Controller.new
mission.create_course_details
mission.navigate_rovers
puts "The squad of rovers have successfully landed"