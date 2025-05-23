private Box[][] grid;
private int[] currentBlock;
private boolean noChange;

void setup(){
  size(800, 600);
  grid = new Box[20][10];
  int size = 25;
  int initX = width / 2 - (size * 10 / 2);
  int initY = height / 2 - (size * 20 / 2);
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[0].length; j++){
      grid[i][j] = new Box(color(0), new int[]{initX + size * j, initY + size * i}, size);
    }
  }
  drawGrid();
}

void drawGrid(){
  for(int i = 0; i < 20; i++){
    for(int j = 0; j < 10; j++){
      grid[i][j].drawBox();
    }
  }
}

void draw(){
  noChange = true;
  if(noChange){
    //some code for generating new block
  }
  else{
    //make curentBlock fall, update the grid, then update currentBlock
  }
}
