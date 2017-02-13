require 'plateau'

describe Plateau do
    
    context '#initialize new plateau' do
        it 'starts from x and y coordinates' do 
            plateau = described_class.new(0,0)
            expect(plateau.max_x).to eq 0
            expect(plateau.max_y).to eq 0
        end
    end
    
end