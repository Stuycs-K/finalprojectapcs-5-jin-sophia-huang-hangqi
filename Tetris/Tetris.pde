private Board grid;
private Tetromino currentBlock;
private char currentBlockType;

void setup() {
  size(800, 600);
  grid = new Board();
  currentBlock = new Tetromino();
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

boolean canCancel(int row){
  for(int j = 0; j < grid.getWidth(); j++){
    if(grid.getColor(row, j) == color(0)){
      return false;
    }
  }
  return true;
}

void cancel(){
  for(int i = grid.getHeight() - 1; i >= 0; i--){
    if(canCancel(i)){
      for(int j = 0; j < grid.getWidth(); j++){
        grid.setColor(i, j, color(0));
      }
      for(int rowsAbove = i - 1; rowsAbove >= 0; rowsAbove--){
        for(int j = 0; j < grid.getWidth(); j++){
          color temp = grid.getColor(rowsAbove, j);
          grid.setColor(rowsAbove + 1, j, temp);
        }
      }
      grid.drawGrid();
    }
  }
}

void drop(){
  while(canFall()){
    fall();
  }
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == LEFT){
      //move left
    }
    if(keyCode == RIGHT){
      //move right
    }
    if(keyCode == UP){
      //rotate
    }
    if(keyCode == DOWN){
      fall();
    }
  }
  if(key == ' '){
    //drop
  }
  grid.drawGrid();
}

void draw() {
  //check if current block can fall; if yes, then make it fall
  //if no fall possible, meaning block has reached ground
  //check if any row can be cancelled
  //generate new block, set current to that block
  //drawgrid
  if (frameCount % 30 == 0) {
    if(canFall()){
      fall();
    }
    else{
      cancel();
      //newBlock, set current
    }
  }
  grid.drawGrid();
}
