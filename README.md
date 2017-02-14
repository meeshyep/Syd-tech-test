<h1> Mars Rover </h1>

To begin, run this command in the terminal:

"ruby Nasa_Homebase.rb"

To alter the instructions for the rovers, go to the instructions.txt instead. The first digits you see indicate the upper-right coordinates of the plateau. The remaining lines indicate the information for the rovers that have been deployed.

<h1>Assumptions</h1>

I assume NASA knows what type of instructions the rovers need in order to operate. However, I have added a checking system done by rovers just in case.

The roves receive their instructions one at a time. 

Once a rover has completed their navigational requirements, the rover is done with its job.

While there are multiple rovers, there is only one plateau to be navigated on.

The code is maintainable and adjustable for as and when more rovers/plateaus are added.

<h1>Further Development</h1>

Allow the rovers to navigate multiple plateaus.

Make the tests more DRY.

Remove the number of instance variables that are used, especiallly in the instructions.

Ensure the rovers do not collide. Right now, this possibilty is just ignored.

**Instructions**

A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth.

A rover’s position and location is represented by a combination of x and y co-ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.

In order to control a rover, NASA sends a simple string of letters. The possible letters are ‘L’, ‘R’ and ‘M’. ‘L’ and ‘R’ makes the rover spin 90 degrees left or right respectively, without moving from its current spot. ‘M’ means move forward one grid point, and maintain the same heading.

Assume that the square directly North from (x, y) is (x, y+1).

**Input:**

The first line of input is the upper-right coordinates of the plateau, the lower- left coordinates are assumed to be 0,0.
The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover’s position, and the second line is a series of instructions telling the rover how to explore the plateau.
The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover’s orientation.
Each rover will be finished sequentially, which means that the second rover won’t start to move until the first one has finished moving.

***Output:** 

The output for each rover should be its final co-ordinates and heading.

**Input and Output**

Test Input:<br>
Plateau: 55 <br>
12N <br>
LMLMLMLMM <br>
33E <br>
MMRMMRMRRM 

Expected Output: <br>
13N <b>
51E 