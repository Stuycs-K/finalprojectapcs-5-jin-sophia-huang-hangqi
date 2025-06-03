public class Ghost extends Tetromino {
  private Tetromino parent;
  public Ghost(Tetromino p) {
    setColor(100);
    type="Ghost";
    parent=p;
  }
}
