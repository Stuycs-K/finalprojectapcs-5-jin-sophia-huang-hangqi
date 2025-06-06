import java.util.Arrays.*;
public class Ghost extends Tetromino {
  private Tetromino parent;
  public Ghost(Tetromino p) {
    setColor(100);
    type="Ghost";
    parent=p;
  }
  
  public void move(int dir) {
     if (canMove(dir)) {
       int[][] moves = {{0, 1}, {-1, 0}, {0, -1}, {1, 0}};
       setPos(new int[]{getPos()[0]+moves[dir][0], getPos()[1]+moves[dir][1]});
     }
   }
  
  public void drawMino(boolean newBlock) {
    if (newBlock) {
      System.out.println(Arrays.toString(getPos()));
      setPos(parent.getPos());
      System.out.println(Arrays.toString(getPos()));
      while (canMove(MOVE_DOWN)) {
       move(MOVE_DOWN);
       System.out.println(Arrays.toString(getPos()));
      }
    }
     int[][] config = parent.rotations[parent.currentRotation];
     for (int i=0; i<config.length; i++) {
       for (int j=0; j<config[i].length; j++) {
         if (config[i][j]==1) {
           try {
             Box b = grid.getBox(getPos()[0]+i, getPos()[1]+j);
             if (newBlock) {
               b.setTetromino(this);
               b.setColor(100);
             } else {
               b.setTetromino(null);
               b.setColor(0);
             }
           } catch (IndexOutOfBoundsException ex) {}
         }
       }
     }
   }
}
