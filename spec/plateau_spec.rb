require 'plateau'

describe Plateau do
    
    context '#initialize new plateau' do
        it 'starts from x and y coordinates' do 
            plateau = described_class.new(5,6)
            expect(plateau.plateau_max_x).to eq 5
            expect(plateau.plateau_max_y).to eq 6
        end
    end
    
end