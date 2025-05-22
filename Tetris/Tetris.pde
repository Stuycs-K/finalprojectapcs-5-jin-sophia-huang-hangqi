private Box[][] grid;

void setup(){
  size(800, 600);
  grid = new Box[20][10];
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[0].length; j++){
      grid[i][j] = new Box(color(0), new int[2]);
    }
  }
  int size = 25;
  int initX = width / 2 - (size * 10 / 2);
  int initY = height / 2 - (size * 20 / 2);
  drawGrid(initX, initY, size);
}

void drawGrid(int initX, int initY, int size){
  stroke(50);
  for(int i = 0; i < 20; i++){
    for(int j = 0; j < 10; j++){
      fill(grid[i][j].getColor());
      square(initX + size * j, initY + size * i, size);
    }
  }
}

void draw(){
}
