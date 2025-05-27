public class Board {
  private color[][] board;

  public Board() {
    board = new color[20][10];
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[0].length; j++) {
        board[i][j] = color(0);
      }
    }
  }
  public void drawGrid() {
    int size = 25;
    int initX = width / 2 - (size * 10 / 2);
    int initY = height / 2 - (size * 20 / 2);
    for (int i = 0; i < 20; i++){
      for(int j = 0; j < 10; j++){
        stroke(50);
        fill(board[i][j]);
        square(initX + j * size, initY + i * size, size);
      }
    }
  }
  public color getColor(int i, int j){
    return board[i][j];
  }
  public void setColor(int i, int j, color newColor){
    board[i][j] = newColor;
  }
  public int getHeight(){
    return board.length;
  }
  public int getWidth(){
    return board[0].length;
  }
}
