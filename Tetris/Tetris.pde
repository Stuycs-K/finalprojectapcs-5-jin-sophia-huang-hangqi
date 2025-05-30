private Board grid;
private Tetromino currentBlock;
private int blockCount;

void setup() {
  size(800, 600);
  grid = new Board();
  currentBlock = new Tetromino();
  blockCount = 1;
  currentBlock.drawMino(true);
  grid.drawGrid();
}

boolean canFall() {
  return currentBlock.canMove('s');
}

void fall() {
  if (canFall()) {
    currentBlock.move('s');
  }
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
  for (int i = grid.getHeight() - 1; i >= 0; i--) {
    if (canCancel(i)) {
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
}

void drop() {
  while (canFall()) {
    fall();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      currentBlock.move('a');
    }
    if (keyCode == RIGHT) {
      currentBlock.move('d');
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
    }
  }
  if (key == 'z' || key == 'Z') {
    currentBlock.rotate(false);
  }
  grid.drawGrid();
}

void draw() {
  //check if current block can fall; if yes, then make it fall
  //if no fall possible, meaning block has reached ground
  //check if any row can be cancelled
  //generate new block, set current to that block
  //drawgrid
  int speed = 40;
  if(blockCount > 20 && blockCount <= 40){
    speed = 30;
  }
  if(blockCount > 40 && blockCount <= 60){
    speed = 20;
  }
  if(blockCount > 60 && blockCount <= 80){
    speed = 15;
  }
  if (frameCount % speed == 0) {
    if (canFall()) {
      fall();
    } else {
      cancel();
      currentBlock = new Tetromino();
      blockCount++;
    }
    grid.drawGrid();
  }
}
