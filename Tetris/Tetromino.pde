public class Tetromino {
  private color c;
  private char shape;
  private Box[][][] positions;
  private int currentPosition;
  
  public Tetromino() {
    int[] colors={0, 0, 0, 0, 0, 0, 0};
    char[] shapes = {'O', 'I', 'S', 'Z', 'L', 'I', 'T'};
    int[][][][] allPositions = {
      {
      {{0, 0, 0, 0},
      {1, 1, 1, 1},
      {0, 0, 0, 0},
      {0, 0, 0, 0}}, 
     {{0, 0, 1, 0},
      {0, 0, 1, 0},
      {0, 0, 1, 0},
      {0, 0, 1, 0}},
     {{0, 0, 0, 0},
      {1, 1, 1, 1},
      {0, 0, 0, 0},
      {0, 0, 0, 0}}, 
     {{0, 0, 0, 0},
      {1, 1, 1, 1},
      {0, 0, 0, 0},
      {0, 0, 0, 0}}}
    };
    int type = (int)(7*Math.random());
    c=colors[type];
    shape=shapes[type];
    currentPosition=0;
  }
}
