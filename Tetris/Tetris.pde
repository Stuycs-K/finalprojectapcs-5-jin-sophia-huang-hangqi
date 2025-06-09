import processing.sound.*;

private Board grid;
Tetromino currentBlock;
private Ghost currentGhost;
Tetromino heldBlock;
private int turnsUntilFall=0;
public static final int MOVE_RIGHT=0;
public static final int MOVE_UP=1;
public static final int MOVE_LEFT=2;
public static final int MOVE_DOWN=3;
PFont Tetris;
private boolean end;
private boolean firstTime=true;
private boolean held;
private SoundFile file;
PImage background;
BlockQueue queue;
ScoreBox score;


void setup() {
  size(800, 600);
  grid = new Board(10, 20, width / 2 - (25 * 10 / 2), height / 2 - (25 * 20 / 2));
  background = loadImage("Data/wp2675347.jpg");
  background(background);
  held=false;
  heldBlock=null;
  queue = new BlockQueue();
  currentBlock = queue.next();
  currentGhost = new Ghost(currentBlock);
  currentBlock.setPos(new int[] {-2, 3});
  currentBlock.drawMino(true);
  currentGhost.drawMino(true);
  grid.drawGrid();
  Tetris = createFont("Data/bruce-forever.regular.ttf", 50);
  drawHold();
  end = false;
  if (firstTime) {
    file = new SoundFile(this, "Data/Tetris.mp3");
    file.loop();
  }
  score = new ScoreBox();
}

public void drawHold() {
    stroke(255);
    strokeWeight(3);
    fill(75);
    rect(80, 50, 170, 150, 10);
    textFont(Tetris);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(24);
    text("HOLD", 170, 70);
    Board holdBoard=new Board(6, 4, 90, 90);
    for (int i = 0; i < holdBoard.getHeight(); i++) {
      for (int j = 0; j < holdBoard.getWidth(); j++) {
        holdBoard.setColor(i, j, 0);
      }
    }
    if (heldBlock!=null) {
      int[][] rot = heldBlock.getRotations()[0];
      for (int i=0; i<4; i++) {
        for (int j=0; j<4; j++) {
          if (rot[i][j]==1) {
            holdBoard.setColor(i, j+1, heldBlock.getColor());
          }
        }
      }
    }
    holdBoard.drawGrid();
  }

boolean canFall() {
  return currentBlock.canMove(MOVE_DOWN);
}

void fall() {
  int rowDropped = 0;
  if (canFall()) { //<>// //<>//
    currentBlock.move(MOVE_DOWN);
    rowDropped++;
  } //<>//
  score.addScore(2 * rowDropped);
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
  int rowCancelled = 0;
  for (int i = grid.getHeight() - 1; i >= 0; i--) {
    if (canCancel(i)) {
      rowCancelled++;
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
  } //<>//
  score.addRows(rowCancelled);
  if (rowCancelled == 1) {
    score.addScore(100 * score.getLevel());
  } //<>//
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
  text("GAME OVER", 400, 275);
  textAlign(CENTER);
  textSize(20); //<>// //<>//
  text("Score: " + score.getScore(), 400, 315);
  textSize(12);
  text("Press R to restart", 400, 335);
}
 //<>//
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
      while (canFall()) { //<>//
        fall();
        turnsUntilFall=1;
      }
    } //<>//
    if (key == 'z' || key == 'Z') {
      currentGhost.drawMino(false);
      currentBlock.drawMino(false);
      if (currentBlock.rotate(false)) {
         currentGhost.rotate(false);
      }
      currentGhost.drawMino(true);
      currentBlock.drawMino(true);
    }
    if (key == 'c' || key == 'C') {
      if (!held) {
        held=true;
        currentBlock.drawMino(false);
        currentGhost.drawMino(false);
        boolean empty = (heldBlock==null);
        if (empty) {
          heldBlock=currentBlock;
          currentBlock = queue.next();
        } else {
          Tetromino tempMino = heldBlock;
          heldBlock=currentBlock;
          currentBlock=tempMino;
          currentBlock.setRotationIndex(0);
        }
        currentBlock.setPos(new int[] {-2, 3});
        currentGhost = new Ghost(currentBlock);
        currentBlock.drawMino(true);
        currentGhost.drawMino(true);
        drawHold();
      }
    }
    grid.drawGrid();
  }
  if(key == 'r' || key == 'R'){
    firstTime=false;
    if(end){
      file.pause();
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
        if (turnsUntilFall==0) {
          turnsUntilFall=2;
        } else if (turnsUntilFall>1) {
          turnsUntilFall--;
        } else if (turnsUntilFall==1) {
          turnsUntilFall=0;
          if (isEnd()) {
          end = true;
        }
        held=false;
          currentBlock.drawMino(true);
          currentBlock = queue.next();
          currentBlock.setPos(new int[] {-2, 3});
          currentGhost = new Ghost(currentBlock);
        cancel();
          currentBlock.drawMino(true);
          currentGhost.drawMino(true);
        }
        score.drawNext();
      }
      grid.drawGrid();
    }
  } else {
    endGame();
  }
}
