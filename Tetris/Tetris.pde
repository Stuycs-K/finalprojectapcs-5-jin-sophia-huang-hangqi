private Board grid;
private int[] currentBlock;
private char currentBlockType;

void setup() {
  size(800, 600);
  grid = new Board();
  color randomColor = color((float) random(256), (float) random(256), (float) random(256));
  color[][] block = {
    {color(0), color(0), color(0), color(0)},
    {randomColor, randomColor, randomColor, randomColor},
    {color(0), color(0), color(0), color(0)},
    {color(0), color(0), color(0), color(0)}
  };
  currentBlock = new int[] {0, 3};
  currentBlockType = 'I';
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      color temp = block[i][j];
      grid.setColor(currentBlock[0] + i, currentBlock[1] + j, temp);
    }
  }
  grid.drawGrid();
}

boolean canFall() {
  for (int j = 0; j < 4; j++) {
    boolean first = false;
    for (int i = 3; i >= 0 && !first; i--) {
      if (currentBlock[0] + i < grid.getHeight()) {
        if (grid.getColor(currentBlock[0] + i, currentBlock[1] + j) != color(0)) {
          if (currentBlock[0] + i + 1 < grid.getHeight()) {
            if (grid.getColor(currentBlock[0] + i + 1, currentBlock[1] + j) != color(0)) {
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
      if (currentBlock[0] + i < grid.getHeight()) {
        color temp = grid.getColor(currentBlock[0] + i, currentBlock[1] + j);
        if (temp != color(0)) {
          grid.setColor(currentBlock[0] + i + 1, currentBlock[1] + j, temp);
          grid.setColor(currentBlock[0] + i, currentBlock[1] + j, color(0));
        }
      }
    }
  }
  currentBlock = new int[] {currentBlock[0] + 1, currentBlock[1]};
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
