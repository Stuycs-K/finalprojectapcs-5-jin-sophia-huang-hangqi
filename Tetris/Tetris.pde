void setup(){
  size(800, 600);
  fill(255);
  int size = 25;
  int initX = width / 2 - (size * 10 / 2);
  int initY = height / 2 - (size * 20 / 2);
  rect(initX, initY, size * 10, size * 20);
  drawGrid(initX, initY, size);
}

void drawGrid(int initX, int initY, int size){
  fill(0);
  stroke(50);
  for(int i = 0; i < 20; i++){
    for(int j = 0; j < 10; j++){
      square(initX + size * j, initY + size * i, size);
    }
  }
}
