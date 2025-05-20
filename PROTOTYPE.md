
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
- An Object class that represents the grid of Tetris, which is a 20 by 10 grid (either through array or Deque). If doing Color[][], each slot holds the color of that box. The grid is then drawn through Processing.
- An Object class that represent each type of block. Each type of block is stored as a final constant in the class, and will be represented by a 4 by 4 Color[][]. Upon construction, a random block is chosen and a random color is chosen.
- A method for generating blocks onto the grid. The function maps the int[][] of the block onto the grid, centerd at top, and it copies the colors in the block onto the grid.
- A method for making blocks fall. Maybe a recursive function seeing if all connected boxes can fall. If yes, then fall. Maybe also a boolean for each block keeping track whether they already settled.
- In draw, check if any row is full. If yes, cancel out and move all blocks down.
- keyPressed methods for moving left, right, and dropping
- Rotation?


    
# Intended pacing:

How you are breaking down the project and who is responsible for which parts.

A timeline with expected completion dates of parts of the project. (CHANGE THIS!!!!!)

1. Grid, block, and generate by Friday, 5/23
2. Fall by Monday 5/26
3. Clear, keyPressed by Wed 5/28
4. Rotation by Fri 5/30
5. Other features

