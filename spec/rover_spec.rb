require 'rover'

describe Rover do
 
 subject(:rover) {described_class.new(1,0,0,"N")}
    
    context '#initialise new rover' do
     
     it 'starts with x,y coordinates and compass' do
       expect(rover.id).to eq 1
       expect(rover.x_coordinate).to eq 0
       expect(rover.y_coordinate).to eq 0
       expect(rover.direction).to eq "N"
     end
    end
 
    context '#move' do
     
     it 'will move to navigation points' do
       rover.move
       expect(rover.x_coordinate).to eq 0
       expect(rover.y_coordinate).to eq 1
     end
    end
   
    context '#change_direction' do
     
     it 'can turn right' do
       rover.turn("R")
       expect(rover.direction).to eq "E"
     end

     it 'can turn left' do
       rover.turn("L")
       expect(rover.direction).to eq "W"
     end
   end
   
    context '#states the coordinates and direction' do
     
      it 'can state it\'s coordinates and direction' do
        expect(rover.state_coordinates_and_direction).to eq "0, 0, pointing N"
      end
    end

    context '#give instructions' do
     
     it 'understands a series of instructions stating how to explore the plateau' do
      letter = ["L", "M", "L", "M", "L", "M", "L", "M", "M"]
      letter.each do |letter|
        rover.give_instructions_to_rover(letter)
      end
      expect(rover.state_coordinates_and_direction).to eq "0, 1, pointing N"
     end
    end
    
   end