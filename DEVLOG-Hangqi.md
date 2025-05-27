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
