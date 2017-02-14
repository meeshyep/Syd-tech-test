require 'navigation'
 
 describe Navigation do
 
  subject(:navigation) {described_class.new('./lib/navigation_test.txt')}

  context '#initialise' do
    it 'starts with the navigation loaded from the text file' do
      expect(navigation.load_navigation_from_file).to be_a_kind_of(String)
    end
  end

  context '#interprets_navigation' do
    it 'interprets the navigation to an easily readable form' do
      subject.interprets_navigation
      expect(subject.navigation_array.length).to eq 9
      expect(subject.navigation_array).to be_a_kind_of(Array)
    end
  end

  context '#separate_plateau_from_rovers' do
    it 'sets the navigation only for the rovers' do
      subject.interprets_navigation
      subject.separate_plateau_from_rovers
      expect(subject.navigation_array.length).to eq 8
      expect(subject.plateau_params).to eq [5, 5]
      expect(subject.plateau_params).to be_a_kind_of(Array)
      expect(subject.plateau_params.length).to eq 2
    end
  end

  context '#create_rovers_initial_and_navigation_arrays' do
    it 'separate initial location from end location directions' do
      subject.interprets_navigation
      subject.separate_plateau_from_rovers
      subject.create_rovers_initial_and_navigation_arrays
      expect(subject.rover_initial_params).to eq [[4, 4, "E"], [2, 3, "N"], [4, 1, "E"], [1, 4, "S"]]
      expect(subject.rover_navigation).to eq [["M", "R", "M"], ["L", "R", "L"], ["M", "L", "M", "M", "L", "M"], ["M", "R", "M", "R", "M", "L", "M"]]
    end
  end

  context '#navigation_to_array' do
    it 'change string to array' do
      subject.interprets_navigation
      subject.separate_plateau_from_rovers
      subject.navigation_to_array
      expect(subject.navigation_array.length).to eq 9
      expect(subject.navigation_array).to be_a_kind_of(Array)
    end
  end

  context '#remove_last_paragraph' do
    it 'removes leftover space from the bottom of the navigation' do
      subject.interprets_navigation
      subject.separate_plateau_from_rovers
      subject.navigation_to_array
      subject.remove_last_paragraph
      expect(subject.navigation_array[8]).to eq "MRMRMLM"
      expect(subject.navigation_array[8]).not_to eq "MRMRMLM\n"
    end
  end

  context '#remove_spaces' do
    it 'removes leftover spaces from arrays' do
      subject.interprets_navigation
      subject.separate_plateau_from_rovers
      subject.remove_spaces
      expect(subject.navigation_array).to eq ["44E", "MRM", "23N", "LRL", "41E", "MLMMLM", "14S", "MRMRMLM"]
    end
  end

  context '#edit_navigation' do
    it 'edits the navigation to an easily readable form for nasa' do
      subject.interprets_navigation
      subject.separate_plateau_from_rovers
      subject.remove_spaces
      subject.edit_navigation
      expect(subject.array_of_navigation_arrays[3]).to eq ["L", "R", "L"]
      expect(subject.array_of_navigation_arrays[4]).to eq [4, 1, "E"]
    end
  end

  context '#edit_loop' do
    it 'edits the plateau parameters' do
     expect(subject.edit_loop("AB123")).to eq ["A", "B", 1, 2, 3]
     expect(subject.edit_loop("AB123")).to be_a_kind_of(Array)
    end
  end
end