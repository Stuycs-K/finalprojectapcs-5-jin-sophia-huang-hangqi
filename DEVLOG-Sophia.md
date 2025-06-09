# Dev Log:

This document must be updated daily every time you finish a work session.

## Sophia Jin

### 2025-05-22 - started Box class
wrote instance variables and methods

### 2025-05-23 - Tetromino class
wrote draw function of Box class and started writing Tetromino instance variables

### 2025-05-26 - Tetromino class
made arrays for rotations of tetrominos and started writing method to draw tetrominoes

### 2025-05-27 - Adding methods for moving
making methods for move() and canMove(), updated drawMino() method to include if it's "erasing" an old tetromino

### 2025-05-28 - Fixing canMove()
trying to fix the canMove() method\
fixed the canMove() method! tetrominoes fall correctly, generate new one upon falling

### 2025-05-29 - Fixed many bugs
fixed the move() method to call the canMove() method so blocks don't pass through each other/the walls\
fixed the line clearing method, it now works!

### 2025-05-29 - adding features for more comfortable gameplay
made the blocks pause at the bottom if you don't drop them with space so that you can still move them around

### 2025-06-01 working on rotation
adjusted arrays so that T, S, Z spins would stay in one place

### 2025-06-02 more work on rotation method and ghost
does not rotate if invalid; returns whether or not it can rotate\
trying to implement the "ghost" image of the block of where it's supposed to be when it falls

### 2025-06-05 more work on ghost
somehow the game won't load anymore and I'm trying to figure that out

### 2025-06-06 slowly debugging ghost
got rid of the infinite loop; made new constructor for Tetromino so rotations hopefully work properly\
managed to fix rotations, but now there are inconsistencies with line clearing (and probably with the criteria for a box being empty)

### 2025-06-08 finished debugging ghost! + hold method
fixed the issue with line clearing and new tetromino generation\
made method to "hold" blocks; blocks can only switch into the hold mode once per turn, also made visuals for this
