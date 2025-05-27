public class Board {
  private Box[][] board;
  private int size = 25;
  
  public Board() {
    board = new Box[20][10];
    int initX = width / 2 - (size * 10 / 2);
    int initY = height / 2 - (size * 20 / 2);
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[0].length; j++) {
        board[i][j] = new Box(0, new int[]{initX + j * size, initY + i * size}, size);
      }
    }
  }
  public void drawGrid() {
    for (int i = 0; i < 20; i++){
      for(int j = 0; j < 10; j++){
        board[i][j].drawBox();
      }
    }
  }
  public color getColor(int i, int j){
    return board[i][j].getColor();
  }
  public void setColor(int i, int j, color newColor){
    board[i][j].setColor(newColor);
  }
  public int getHeight(){
    return board.length;
  }
  public int getWidth(){
    return board[0].length;
  }
  
  public Box getBox(int i, int j) {
    return board[i][j];
  }
  
  public void setBox(int i, int j, Box b) {
    board[i][j]=b;
  }
}
