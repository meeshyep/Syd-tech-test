class Navigation
 
   attr_reader :plateau_params,:rover_initial_params, :rover_navigation, 
               :load_navigation_from_file, :navigation_array, :array_of_navigation_arrays
 
    def initialize(file)
      @load_navigation_from_file = File.read(file)
    end
 
    def create_parameters_from_input
      process_navigation
      separate_plateau_from_rovers
      create_rovers_initial_and_navigation_arrays
    end

    def interprets_navigation
      navigation_to_array
      remove_spaces
      remove_last_paragraph
    end
    
    def separate_plateau_from_rovers
      get_plateau_parameter
      remove_plateau_details_from_array
    end

    def create_rovers_initial_and_navigation_arrays
      edit_navigation
      create_arrays_of_parameters_and_navigation
    end

    def navigation_to_array
      @navigation_array = @load_navigation_from_file.split(/\n\n/)
    end

    def remove_last_paragraph
      last_line = @navigation_array.pop
      last_line.gsub!("\n","")
      @navigation_array.push(last_line)
    end

    def remove_spaces
      @navigation_array.each do |element|
        element.gsub!(" ","")
      end
    end

    def get_plateau_parameter
      @plateau_params = @navigation_array[0].split("").map(&:to_i)
    end

    def remove_plateau_details_from_array
      @navigation_array.shift
    end

    def edit_navigation
      @array_of_navigation_arrays = []
      @navigation_array.each do |element|
      element_to_array = edit_loop(element)
      @array_of_navigation_arrays << element_to_array
    end
    end

    def edit_loop(string)
      new_array = []
      string_to_array = string.split("")
      string_to_array.each do |character|
        if character =~ /[[:alpha:]]/
          new_character = character.to_s
          new_array << new_character
        elsif character =~ /[[:digit:]]/
          new_character = character.to_i
          new_array << new_character
        end
    end
    new_array
    end

    def create_arrays_of_parameters_and_navigation
      @rover_initial_params = []
      @rover_navigation = []
      @array_of_navigation_arrays.each_with_index do |element, index|
        if index % 2 == 0
          @rover_initial_params << element
        elsif index % 2 != 0
          @rover_navigation << element
        end
       end
    end
end