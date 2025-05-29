private Board grid;
private Tetromino currentBlock;
public static final int MOVE_RIGHT=0;
public static final int MOVE_UP=1;
public static final int MOVE_LEFT=2;
public static final int MOVE_DOWN=3;

void setup() {
  size(800, 600);
  grid = new Board();
  currentBlock = new Tetromino();
  currentBlock.drawMino(true);
  grid.drawGrid();
}

boolean canFall() {
  return currentBlock.canMove(MOVE_DOWN);
}

void fall() {
  if (canFall()) {
    currentBlock.move(MOVE_DOWN);
  }
}

boolean canCancel(int row){
  for(int j = 0; j < grid.getWidth(); j++){
    if(grid.getColor(row, j) == 0){
      println("false "+row);
      return false;
    }
  }
  println("true "+row);
  return true;
}

void cancel(){
  for(int i = grid.getHeight() - 1; i >= 0; i--){
    if(canCancel(i)){
      System.out.println("canceled row "+i);
      for(int j = 0; j < grid.getWidth(); j++){
        grid.setColor(i, j, color(0));
      }
      for(int rowsAbove = i - 1; rowsAbove >= 0; rowsAbove--){
        for(int j = 0; j < grid.getWidth(); j++){
          color temp = grid.getColor(rowsAbove, j);
          grid.setColor(rowsAbove + 1, j, temp);
        }
      }
      i++;
      //grid.drawGrid();
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
      currentBlock.move(MOVE_LEFT);
    }
    if(keyCode == RIGHT){
      currentBlock.move(MOVE_RIGHT);
    }
    if(keyCode == UP){
      currentBlock.rotate(true);
    }
    if(keyCode == DOWN){
      fall();
    }
  }
  if(key == ' '){
    while(canFall()){
      fall();
    }
  }
  if(key == 'z' || key == 'Z'){
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
  if (frameCount % 30 == 0) {
    if(canFall()){
      fall();
    } else {
      //cancel();
      currentBlock = new Tetromino();
    }
    grid.drawGrid();
  }
}
