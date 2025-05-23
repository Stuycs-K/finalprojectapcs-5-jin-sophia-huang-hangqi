public class Tetromino {
  private color c;
  private char shape;
  private Box[][] positions;
  private int currentPosition;
  
  public Tetromino() {
    int[] colors={0, 0, 0, 0, 0, 0, 0};
    char[] shapes = {'O', 'I', 'S', 'Z', 'L', 'I', 'T'};
    int type = (int)(7*Math.random());
    c=colors[type];
    shape=shapes[type];
    currentPosition=0;
  }
}
