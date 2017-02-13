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
   
   context '#states the coordinates and compass' do
     it 'can state it\'s coordinates and compass' do
       rover = described_class.new(4,8,"N")
       expect(rover.state_coordinates_and_direction).to eq "4, 8, pointing N"
     end
   end
    
end