import processing.sound.*;

private Board grid;
private Tetromino currentBlock;
private int turnsUntilFall=0;
public static final int MOVE_RIGHT=0;
public static final int MOVE_UP=1;
public static final int MOVE_LEFT=2;
public static final int MOVE_DOWN=3;
PFont Tetris;
private boolean end;
private SoundFile file;
PImage background;
BlockQueue queue;
ScoreBox score;

void setup() {
  size(800, 600);
  grid = new Board(10, 20, width / 2 - (25 * 10 / 2), height / 2 - (25 * 20 / 2));
  background = loadImage("Data/wp2675347.jpg");
  background(background);
  queue = new BlockQueue();
  currentBlock = queue.next();
  currentBlock.setPos(new int[] {-2, 3});
  currentBlock.drawMino(true);
  grid.drawGrid();
  Tetris = createFont("Data/bruce-forever.regular.ttf", 50);
  end = false;
  file = new SoundFile(this, "Data/Tetris.mp3");
  file.loop();
  score = new ScoreBox();
}

boolean canFall() {
  return currentBlock.canMove(MOVE_DOWN);
}

void fall() {
  int rowDropped = 0;
  if (canFall()) {
    currentBlock.move(MOVE_DOWN);
    rowDropped++;
  }
  score.addScore(2 * rowDropped);
}

boolean canCancel(int row) {
  for (int j = 0; j < grid.getWidth(); j++) {
    if (grid.getColor(row, j) == 0) {
      return false;
    }
  }
  return true;
}

void cancel() {
  int rowCancelled = 0;
  for (int i = grid.getHeight() - 1; i >= 0; i--) {
    if (canCancel(i)) {
      rowCancelled++;
      for (int j = 0; j < grid.getWidth(); j++) {
        grid.setColor(i, j, color(0));
      }
      for (int rowsAbove = i - 1; rowsAbove >= 0; rowsAbove--) {
        for (int j = 0; j < grid.getWidth(); j++) {
          color temp = grid.getColor(rowsAbove, j);
          grid.setColor(rowsAbove + 1, j, temp);
        }
      }
      i++;
    }
  }
  score.addRows(rowCancelled);
  if (rowCancelled == 1) {
    score.addScore(100 * score.getLevel());
  }
  if (rowCancelled == 2) {
    score.addScore(300 * score.getLevel());
  }
  if (rowCancelled == 3) {
    score.addScore(500 * score.getLevel());
  }
  if (rowCancelled >= 4) {
    score.addScore(800 * score.getLevel());
  }
}

void drop() {
  while (canFall()) {
    fall();
  }
}

boolean isEnd() {
  return currentBlock.getPos()[0] < 0;
}

void endGame() {
  fill(100);
  rect(275, 250, 250, 100, 10);
  textFont(Tetris);
  fill(255);
  textSize(29);
  textAlign(CENTER, CENTER);
  text("GAME OVER", 400, 300);
  textAlign(CENTER);
  textSize(20);
  text("Score: " + score.getScore(), 400, 340);
}

void keyPressed() {
  if (!end) {
    if (key == CODED) {
      if (keyCode == LEFT) {
        currentBlock.move(MOVE_LEFT);
      }
      if (keyCode == RIGHT) {
        currentBlock.move(MOVE_RIGHT);
      }
      if (keyCode == UP) {
        currentBlock.rotate(true);
      }
      if (keyCode == DOWN) {
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
      currentBlock.rotate(false);
    }
    grid.drawGrid();
  }
  if(key == 'r' || key == 'R'){
    if(end){
      setup();
    }
  }
}

void draw() {
  //check if current block can fall; if yes, then make it fall
  //if no fall possible, meaning block has reached ground
  //check if any row can be cancelled
  //generate new block, set current to that block
  //drawgrid
  if (!end) {
    int speed = score.increLevel();
    if (frameCount % speed == 0) {
      if (canFall()) {
        fall();
        score.addScore(1);
      } else {
        cancel();
        if (isEnd()) {
          end = true;
        }
        if (turnsUntilFall==0) {
          turnsUntilFall=2;
        } else if (turnsUntilFall>1) {
          turnsUntilFall--;
        } else if (turnsUntilFall==1) {
          turnsUntilFall=0;
          currentBlock = queue.next();
          currentBlock.setPos(new int[] {-2, 3});
        }
        score.drawNext();
      }
      grid.drawGrid();
    }
  } else {
    endGame();
  }
}
