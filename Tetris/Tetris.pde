private Board grid;
private Tetromino currentBlock;
private char currentBlockType;

void setup() {
  size(800, 600);
  grid = new Board();
  currentBlock = new Tetromino();
  grid.drawGrid();
}

boolean canFall() {
  return currentBlock.canMove('d');
}

void fall() {
  if (canFall()) {
    currentBlock.move('d');
  }
}


void draw() {
  //check if current block can fall; if yes, then make it fall
  //if no fall possible, meaning block has reached ground
  //check if any row can be cancelled
  //generate new block, set current to that block
  //drawgrid
  if (frameCount % 30 == 0) {
    if (canFall()) {
      fall();
    }
    grid.drawGrid();
  }
}
