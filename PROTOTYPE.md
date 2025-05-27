
# Technical Detail:

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
- a score that displays on the screen
- block falling speeds up as you increase "levels" by clearing some number of lines
- queue of the 3 tetrominoes that will come next
- “hold” function — can keep track of one block but can only switch between the falling and “held” block once
- high score, home page for restarting

     
# Project Design

UML Diagrams and descriptions of key algorithms, classes, and how things fit together.\
**List of necessary functions:**
![Alt text](umldiagram.png?raw=true "Title" ) 
- A Tetris class containing the following methods and instance variables:
     -private Board grid: a 20*10 grid
     - private int[] currentBlock: format of {i, j, h, w}, where i and j are the coordinate for the top left box, while h and w are how high and wide the box is.
     - private char currentBlockType: the type of block currentBlock is; for rotation
     - void setup(): create the grid and draw it
     - void draw(): check if currentBlock can fall, if yes fall; otherwise, check if any rows can be cancelled, cancel them, then generate new block, set currentBlock
     - void newBlock(): create a tetromino, copy and past the value of the colors onto the middle top of the grid, set currentBlock and currentBlockType
     - boolean canCancel(): check if row is colored in
     - void cancel(): check if each row can cancel; if yes, clear that row, move everything else down
- A Box class that represents a single box in the grid of Tetris, which is a 20 by 10 grid (either through array or Deque). If doing Color[][], each slot holds the color of that box. The grid is then drawn through Processing.
     - constructor takes in a color and position
     - instance variables: color c, Box[] neighbors, int[] position
     - methods: boolean isNotEmpty() tells whether the Box actually has a tetris block in it
     - Box getNeighbor(int dir) returns neighbors[dir]
     - void setNeighbor(Box b, int index) sets neighbor[index] to b (new!) 
     - color getColor()
     - void setColor(color c)
     - void drawBox() draws the given Box (new!)
- An ~~Block~~ Tetromino class that represents each type of block. The type of block is stored as a variable in the class, and is represented by a Box[]
     - constructor takes in no args; the shape is randomly chosen and the color is associated with the shape and the position starts at the top middle (might have to be customized for each shape)
     - instance variables: color c, String shape, Box[] position 
     - methods: boolean canMove(int dir) where dir aligns with the index in the neighbors array of the Box
     - void move(int dir) moves it in the given direction (it should call canMove())
     - boolean rotate(boolean clockwise) either rotates it CW or CCW by editing the position array and will return false if you can't rotate
- A method for generating blocks onto the grid. The function maps the int[][] of the block onto the grid, centerd at top, and it copies the colors in the block onto the grid.
- A method for making blocks fall. ~~Maybe a recursive function seeing if all connected boxes can fall. If yes, then fall. Maybe also a boolean for each block keeping track whether they already settled.~~ Keep track of the 4*4 area that the falling block is in. If canFall(), then move everything down by one.
- A canFall() method to see if the block can fall.
- In draw generally draw periodically as the blocks move down, but we also have to change the screen when a line is cleared or when we rotate or move the blocks
- keyPressed methods for moving left, right, and dropping, as well as rotation


    
# Intended pacing:
Ideas to break up the work: Hangqi will work on the graphics and Sophia will work on the classes for the first few phases (1-2). For phase 3, Hangqi will work on the line clearing and block dropping, and Sophia will work on the left and right movement. For phase 4, Hangqi will make the rotations don't make the blocks pass through each other and Sophia will work on the rotation process with the graphics.
1. Grid, ~~block~~, ~~and generate~~ by Friday, 5/23
     - Box class should be working properly; make sure that things with Boxes on the edge don't work weirdly and make sure to test on those
     - ✅We should start out with a black grid when we run, but if we purposely put colored Boxes in, they should show up correctly
     - We should be able to generate blocks randomly. For now, just put them in the middle of the screen so we can see it.
2. Fall, Tetrimino, and generate by Monday 5/26
     - At this point, we should start the blocks from the top
     - they should fall, and we need to call the next block to start falling once the previous one has fallen
     - make sure nothing weird happens with passing through blocks by manually starting out with various arrangements of blocks
3. Clear line, keyPressed (left and right movement, as well as drop) by Wed 5/28
    - not sure about the details but we probably don't want to erase the entire board every time we make a change, especially if it's with respect to the falling block (it's probably somewhat unavoidable for line clears)
    - for the drop, make sure the next block will come after that
    - again, make sure that the blocks will not pass through each other when moving left and right
    - make sure that you're still able to slide under pieces with the left and right movement as long as it's supposed to be physically possible
    - test clearing different amounts of lines at a time to make sure it all works
4. Rotation by Fri 5/30
    - make sure that T-spins are possible!
    - be very careful to make sure rotations don't make blocks pass through one another; perhaps turn off the gravity to test various rotation situations
    - make sure that all types of blocks can be rotated properly
5. Other features (if possible)
   - priority order is probably approximately queue, score, hold, increased speed, music, home screen

