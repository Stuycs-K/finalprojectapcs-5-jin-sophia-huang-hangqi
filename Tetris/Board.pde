public class Board {
  private Box[][] board;

  public Board() {
    board = new Box[20][10];
    int size = 25;
    int initX = width / 2 - (size * 10 / 2);
    int initY = height / 2 - (size * 20 / 2);
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[0].length; j++) {
        board[i][j] = new Box(color(0), new int[]{initX + size * j, initY + size * i}, size);
      }
    }
  }
  
  public Box getBox(int i, int j){
    return board[i][j];
  }
}
