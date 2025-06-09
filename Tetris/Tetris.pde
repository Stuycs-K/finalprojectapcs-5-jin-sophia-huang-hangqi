import processing.sound.*;

private Board grid;
Tetromino currentBlock;
private Ghost currentGhost;
private int turnsUntilFall=0;
public static final int MOVE_RIGHT=0;
public static final int MOVE_UP=1;
public static final int MOVE_LEFT=2;
public static final int MOVE_DOWN=3;
private int blockCount;
PFont Tetris;
private boolean end;
private SoundFile file;
PImage background;
BlockQueue queue;


void setup() {
  size(800, 600);
  grid = new Board();
  background = loadImage("Data/wp2675347.jpg");
  background(background);
  queue = new BlockQueue();
  currentBlock = queue.next();
  currentGhost = new Ghost(currentBlock);
  blockCount = 1;
  currentBlock.drawMino(true);
  currentGhost.drawMino(true);
  grid.drawGrid();
  Tetris = createFont("Data/bruce-forever.regular.ttf", 50);
  end = false;
  file = new SoundFile(this, "Data/Tetris.mp3");
  file.loop();
}

boolean canFall() {
  return currentBlock.canMove(MOVE_DOWN);
}

void fall() {
  if (canFall()) {
    currentBlock.move(MOVE_DOWN);
  }
}

boolean canCancel(int row) {
  for (int j = 0; j < grid.getWidth(); j++) {
    if (!grid.getBox(row, j).isNotEmpty()) {
      return false;
    }
  }
  return true;
}

void cancel() {
  for (int i = grid.getHeight() - 1; i >= 0; i--) {
    if (canCancel(i)) {
      for (int j = 0; j < grid.getWidth(); j++) {
        grid.getBox(i, j).empty();
      }
      for (int rowsAbove = i - 1; rowsAbove >= 0; rowsAbove--) {
        for (int j = 0; j < grid.getWidth(); j++) {
          color temp = grid.getColor(rowsAbove, j);
          grid.setColor(rowsAbove + 1, j, temp);
          grid.getBox(rowsAbove+1, j).setTetromino(grid.getBox(rowsAbove, j).getTetromino());
        }
      }
      i++;
    }
  }
}

void drop() {
  while (canFall()) {
    fall();
  }
}

boolean isEnd() {
  return (grid.getBox(0, 4).isNotEmpty()) || (grid.getBox(0, 5).isNotEmpty()); //<>//
}

void endGame() {
  fill(100);
  rect(275, 250, 250, 100, 10);
  textFont(Tetris);
  fill(255);
  textSize(29);
  textAlign(CENTER, CENTER);
  text("GAME OVER", 400, 300);
}

void keyPressed() {
  if (!end) {
    if (key == CODED) {
      if (keyCode == LEFT && currentBlock.canMove(MOVE_LEFT)) {
        currentBlock.move(MOVE_LEFT);
        currentGhost.drawMino(false);
        currentGhost.drawMino(true);
        currentBlock.drawMino(true);
      }
      if (keyCode == RIGHT && currentBlock.canMove(MOVE_RIGHT)) {
        currentBlock.move(MOVE_RIGHT);
        currentGhost.drawMino(false);
        currentGhost.drawMino(true);
        currentBlock.drawMino(true);
      }
      if (keyCode == UP) {
        currentGhost.drawMino(false);
        currentBlock.drawMino(false);
        if (currentBlock.rotate(true)) {
          currentGhost.rotate(true);
        }
        currentGhost.drawMino(true);
        currentBlock.drawMino(true);
      }
      if (keyCode == DOWN && currentBlock.canMove(MOVE_DOWN)) {
        fall();
      }
    }
    if (key == ' ') {
      while (canFall()) {
        fall();
        turnsUntilFall=1;
      }
    }
    if (key == 'z' || key == 'Z') {
      currentGhost.drawMino(false);
      currentBlock.drawMino(false);
      if (currentBlock.rotate(false)) {
         currentGhost.rotate(false);
      }
      currentGhost.drawMino(true);
      currentBlock.drawMino(true);
    }
    grid.drawGrid();
  }
}

void draw() {
  //check if current block can fall; if yes, then make it fall
  //if no fall possible, meaning block has reached ground
  //check if any row can be cancelled
  //generate new block, set current to that block
  //drawgrid
  if (!end) {
    int speed = 40;
    if (blockCount > 20 && blockCount <= 40) { //<>//
      speed = 30;
    }
    if (blockCount > 40 && blockCount <= 60) {
      speed = 20;
    }
    if (blockCount > 60 && blockCount <= 80) {
      speed = 15;
    }
    if (frameCount % speed == 0) {
      if (canFall()) {
        fall();
      } else {
        if (turnsUntilFall==0) {
          turnsUntilFall=2;
        } else if (turnsUntilFall>1) {
          turnsUntilFall--;
        } else if (turnsUntilFall==1) {
          turnsUntilFall=0;
          currentBlock.drawMino(true);
          currentBlock = new Tetromino();
          currentGhost = new Ghost(currentBlock);
        cancel();
        if (isEnd()) {
          end = true;
        }
          currentBlock.drawMino(true);
          currentGhost.drawMino(true);
          blockCount++;
        }
      }
      grid.drawGrid();
    }
  } else {
    endGame();
  }
}
