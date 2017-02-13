require 'rover'

describe Rover do 
    
    context '#initialise new rover' do
     it 'starts with x,y coordinates and compass' do
       rover = described_class.new(0,0,"N")
       expect(rover.x_coordinate).to eq 0
       expect(rover.y_coordinate).to eq 0
       expect(rover.direction).to eq "N"
     end
   end
 
    context '#move' do
     it 'will move to navigation points' do
       rover = described_class.new(4,8,"N")
       rover.move
       expect(rover.x_coordinate).to eq 4
       expect(rover.y_coordinate).to eq 8
     end
    end
   
    context '#change_direction' do
     it 'can turn right' do
       rover = described_class.new(1,3,"N")
       rover.turn_right
       expect(rover.direction).to eq "E"
     end

     it 'can turn left' do
       rover = described_class.new(1,3,"N")
       rover.turn_left
       expect(rover.direction).to eq "L"
     end
   end
   
    context '#states the coordinates and direction' do
      it 'can state it\'s coordinates and direction' do
        rover = described_class.new(4,8,"N")
        expect(rover.state_coordinates_and_direction).to eq "4, 8, pointing N"
      end
    end

    context '#give instructions' do
     it 'understands a series of instructions stating how to explore the plateau' do
      rover = described_class.new(1,3,"N")
      instructions = ["L", "M", "L", "M", "L", "M", "L", "M", "M"]
      rover.give_instructions_to_rover(instructions)
      expect(rover.state_coordinates_and_direction).to eq "1, 4, pointing N"
     end
    end
    
end