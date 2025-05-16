# Final Project Proposal

## Group Members:

Sophia Jin and Hangqi Huang (Period 5)
       
# IDEAS:
1 **Prime factorization game:**\<br/>
<ins>Basic Description:</ins> Based on the WallPrime game. It’s not available on U.S. Play Store or Apple but here’s a [video](https://www.youtube.com/watch?v=pZCpW3DAEyQ) that demonstrates gameplay for the three easiest levels. Numbers that can be derived by multiplying the first 9 prime numbers will appear and the player has to figure out how to get that number. Each correct combination of the numbers gives the player more time. Additional time multiplier can be added depending on the number of tries. The player tries to score as many points as possible.\
It’s possible that this is a bit too simple so we may try to add extra features (such as being able to pick up power ups as you run).\<br/>
<ins>Details:</ins>
- The format is a guy running and punching walls (the walls have prime numbers written on them), so we will have to add an animation for that.
- Add a home screen with multiple difficulty levels.
- There will be a bar on the top left showing how much time you have left, and text will show up telling you how much time you gain after breaking each wall.
- The input will be displayed.
- You get penalties for incorrect input.

2 **Platform game:**\<br/>
<ins>Basic Description:</ins> Based on [Snail Bob 2](https://www.1001games.com/puzzle/snail-bob-2). A character goes to the right at a constant velocity, and tries to reach the exit on the right. There are obstacles in the way. We will replicate some levels that we find interesting but not all of them, since the original game has 20-30 levels.\<br/>
<ins>Details:</ins>
- Different levels — we’ll need a level map (“home page”)
- Different mechanisms: lava pits, spikes, wind lift up, enemy eating you, can do 2x speed
- score for each level based on time needed to complete (300-t, where t is the seconds it takes) or we could do a star rating if needed

3 **Tetris:**\<br/>
<ins>Basic Description:</ins> Based on [Tetris](https://play.tetris.com/). Drop tetrominoes that fall faster and faster as the levels go up. Fill a row to clear the row. You get more points for stuff like all clear, tetris (clearing four rows at once), T-spins, or combos (multiple high-level line clears/T-spins in a row). This will attempt to completely replicate the original Tetris game.\<br/>
<ins>Details:</ins>
- Cancel out row once complete; keep track using array/or rows represented by Deque
- each tetromino is represented by a color
