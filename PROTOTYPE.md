
# Technical Detail:

(CHANGE THIS!!!!!)
A description of your technical design. This should include: 
How you will be using the topics covered in class in the project.


**PERIOD:** 5\
**Groupt Members:** Sophia Jin and Hangqi Huang\
**Group Name:** Metrominoes \
**Brief Project description (1 paragraph summary):**\
We're are making a game of Tetris. In Tetris, tetrominoes are dropped and they fall faster and faster as the time goes on. There are 7 tetrominoes (I, O, T, S, Z, L, J), and we use keys to rotate them and move them around. Fill a row to clear the row. You get more points for feats like tetris (clearing four rows at once) or T-spins or combos. This will attempt to completely replicate the original Tetris game.\
**Expanded Description:**\
Critical Features (Minimum Viable Product):
- Representation of grid using array or Deque
- Randomized block generation
- block should fall down but pause before settling
- Cancel out row once complete
- key controls for rotation of blocks
- key controls for moving left/right and dropping

Nice to have features:
- Tetris music!!! + settings to turn off music/sfx
- block falling speeds up as you increase "levels" by clearing some number of lines
- queue of the 3 tetrominoes that will come next
- “hold” function — can keep track of one block but can only switch between the falling and “held” block once
- high score, home page for restarting

     
# Project Design

UML Diagrams and descriptions of key algorithms, classes, and how things fit together.\
**List of necessary functions:**
- A Box class that represents a single box in the grid of Tetris, which is a 20 by 10 grid (either through array or Deque). If doing Color[][], each slot holds the color of that box. The grid is then drawn through Processing.
     - constructor takes in a color and position
     - instance variables: color c, Box[] neighbors, int[] position
     - methods: boolean isNotEmpty() tells whether the Box actually has a tetris block in it
     - Box getNeighbor(int dir) returns neighbors[dir]
- An Block class that represents each type of block. The type of block is stored as a variable in the class, and is represented by a Box[]
     - constructor takes in no args; the shape is randomly chosen and the color is associated with the shape and the position starts at the top middle (might have to be customized for each shape)
     - instance variables: color c, String shape, Box[] position 
     - methods: boolean canMove(int dir) where dir aligns with the index in the neighbors array of the Box
     - void move(int dir) moves it in the given directly (it should call canMove())
     - boolean rotate(boolean clockwise) either rotates it CW or CCW by editing the position array and will return false if you can't rotate
- A method for generating blocks onto the grid. The function maps the int[][] of the block onto the grid, centerd at top, and it copies the colors in the block onto the grid.
- A method for making blocks fall. Maybe a recursive function seeing if all connected boxes can fall. If yes, then fall. Maybe also a boolean for each block keeping track whether they already settled.
- In draw generally draw periodically as the blocks move down, but we also have to change the screen when a line is cleared or when we rotate or move the blocks
- keyPressed methods for moving left, right, and dropping, as well as rotation


    
# Intended pacing:

How you are breaking down the project and who is responsible for which parts.

A timeline with expected completion dates of parts of the project. (CHANGE THIS!!!!!)

1. Grid, block, and generate by Friday, 5/23
2. Fall by Monday 5/26
3. Clear, keyPressed by Wed 5/28
4. Rotation by Fri 5/30
5. Other features

