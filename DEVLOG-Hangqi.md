# Dev Log:

This document must be updated daily every time you finish a work session.

## Hangqi Huang

### 2025-05-22 - Started the Tetris class
Spent the whole in class period testing with different dimensions of screen and boxes. Still need to find a way to intergrate Box class and Tetris.

### 2025-05-22 - Integrated Box[][] with grid
A Box[][] was declared and initialized as grid. grid was then filled up with Boxes of color(0), or black. The grid was then drawn according to the color inside each box. Total of half an hour spent.

### 2025-05-23 - Separated grid and Tetris
To make things more convenient, I moved Grid.class out from Tetris.class. Need to work on random generation of blocks and fall.

### 2025-05-24 - canFall(), fall(), and others
Separated Board class and Box class; instead using Box[][], now uses color[][]. Box is now useless, though may need for future additions (?). canFall() and fall() written, seems to work, though more testing is needed.

### 2025-05-27 - Integration of Sophia's ideas and my ideas
We ran into some issues regarding how we each want things to be done. I believe we can work everything out by manipulating the board, but Sophia thinks it's better to put more things in the Tetromino class. Still trying to figure that out. But as long as it works, it works.

### 2025-05-27 - Stalled Progress
There are issues with canMove(), which causes really big issues with everything. I can not attempt to fix it because I don't know where I should start. The method should be split into parts, or else a really length method. The method is too general. Wrote canCancel() and cancel(), but can not test. Wrote drop, but can not test because canMove() and move() is broken. keyPressed setup. End of report

### 2025-05-28 - newBlock()
Added z key for rotation. wrote new block, not tested.

### 2025-05-28 - Stalled Progress
Fixed some minor things. Waiting for canMove() to be fixed. Attempted fix, but things are so complicated that it feels like a junk pile.

### 2025-05-29 canMove() fixed
canMove() fixed. Trying to figure out cancel()...???

### 2025-05-29 canCancel() fixed
Debugged canCancel(). Everything seems to work now, though for some reason the whole thing feels clinky. canRotate has to be written. How the game ends has to be written.

### 2025-05-30 still figuring out end; increase speed added
End needs to be based on whether the fact that new blocks can be dropped or not. How exactly to do this is still unknown. Instead, I added an increasing speed function.

### 2025-05-30 end done
End screen completed. Though isEnd() might still needs a small fixing. Sometimes even when there is still a row left, the game renders as end. But no big deal.
isEnd() is fixed.

### 2025-06-02 added music, working on queue
Added music during class, but not seem to be working now. Added BlockQueue class, but didn't save, so have to start from scratch. Sigh.

### 2025-06-03 basic layout of queue
Got the grid and box for the queue, but need to figure out how to draw the tetrominoes on there. Might need to modify the tetromino constructor.

### 2025-06-03 got BlockQueue working
The next three blocks can now be displayed. Score calculation done and speed calculation redo.

### 2025-06-05 got scoreBox working; beautified queue
The scoreBox now shows the score, level, and number of lines cleared. The queue now looks a bit better.

### 2025-06-06 added restart key
Press r to restart; only active when game is over.

### 2025-06-08 optimized tetromino generation
Instead of random, now the generation of Tetrominoes is based on a permutation of the seven tetrominoes.\

I believe this document accurately reflects the contributions of my teammate. - Sophia
