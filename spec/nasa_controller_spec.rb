require './lib/nasa_controller'

describe Nasa_Controller do 
    
    subject(:nasa_controller) {described_class.new}

  context '#starts mission' do
    
    it 'creates the instructions for the rovers, plateau and navigation' do
      subject.create_course_details
      expect(subject.current_rovers).to be_a_kind_of(Array)
      expect(subject.current_rovers[0]).to be_a_kind_of(Rover)
      expect(subject.current_rovers.length).to eq 2
      expect(subject.plateau).to be_a_kind_of(Plateau)
      expect(subject.navigation).to be_a_kind_of(Navigation)
    end
  end

  context '#giving navigation details to the rovers' do
    
    it 'navigates the rovers' do
      subject.create_course_details
      subject.navigate_rovers
      expect(subject.current_rovers[0].state_coordinates_and_direction).to eq "5, 3, pointing S"
    end
  end

  context '#sending instructions' do
    
    it 'talks to the rovers' do
      subject.create_course_details
      subject.send_navigation_to_rover(subject.current_rovers[0], ["M","R","M","M"], 1)
      expect(subject.current_rovers[0].state_coordinates_and_direction).to eq "5, 2, pointing S"
    end
    
    it 'doesn\'t talk to lost rovers' do
      subject.create_course_details
      subject.send_navigation_to_rover(subject.current_rovers[0], ["M","M","M","M","M","M","M","M"], 1)
      expect(subject.current_rovers[0].state_coordinates_and_direction).to eq "6, 4, pointing E"
    end
  end

  context '#lost rovers' do
    it 'know if a rover is lost' do
      subject.create_course_details
      subject.send_navigation_to_rover(subject.current_rovers[0], ["M","M","M","M","M"], 1)
      expect(subject.current_rovers[0].status).to eq "Lost"
    end
  end
end