private Board grid;
private int[] currentBlock;
private boolean noChange;

void setup(){
  size(800, 600);
  grid = new Board();
  drawGrid();
}

void drawGrid(){
  for(int i = 0; i < 20; i++){
    for(int j = 0; j < 10; j++){
      grid.getBox(i, j).drawBox();
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
