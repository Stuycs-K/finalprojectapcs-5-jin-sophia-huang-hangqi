private Board grid;
private int[] currBlockPos;
private Tetromino currBlock;

void setup() {
  size(800, 600);
  grid = new Board();
  //color randomColor = color((float) random(256), (float) random(256), (float) random(256));
  //color[][] block = {
  //  {color(0), color(0), color(0), color(0)},
  //  {randomColor, randomColor, randomColor, randomColor},
  //  {color(0), color(0), color(0), color(0)},
  //  {color(0), color(0), color(0), color(0)}
  //};
  //currBlockPos = new int[] {0, 3};
  //for (int i = 0; i < 4; i++) {
  //  for (int j = 0; j < 4; j++) {
  //    color temp = block[i][j];
  //    grid.setColor(currBlockPos[0] + i, currBlockPos[1] + j, temp);
  //  }
  //}
  newBlock();
  grid.drawGrid();
}

boolean canFall() {
  for (int j = 0; j < 4; j++) {
    boolean first = false;
    for (int i = 3; i >= 0 && !first; i--) {
      if (currBlockPos[0] + i < grid.getHeight()) {
        if (grid.getColor(currBlockPos[0] + i, currBlockPos[1] + j) != color(0)) {
          if (currBlockPos[0] + i + 1 < grid.getHeight()) {
            if (grid.getColor(currBlockPos[0] + i + 1, currBlockPos[1] + j) != color(0)) {
              return false;
            }
          } else {
            return false;
          }
          first = true;
        }
      }
    }
  }
  return true;
}

void fall() {
  for (int i = 3; i >= 0; i--) {
    for (int j = 0; j < 4; j++) {
      if (currBlockPos[0] + i < grid.getHeight()) {
        color temp = grid.getColor(currBlockPos[0] + i, currBlockPos[1] + j);
        if (temp != color(0)) {
          grid.setColor(currBlockPos[0] + i + 1, currBlockPos[1] + j, temp);
          grid.setColor(currBlockPos[0] + i, currBlockPos[1] + j, color(0));
        }
      }
    }
  }
  currBlockPos = new int[] {currBlockPos[0] + 1, currBlockPos[1]};
}

void newBlock(){
  currBlock = new Tetromino();
  currBlock.drawMino(true);
  currBlockPos = new int[] {0, 3};
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
