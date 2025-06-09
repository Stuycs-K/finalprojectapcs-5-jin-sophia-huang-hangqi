import java.util.Arrays.*;
public class Ghost extends Tetromino {
  private Tetromino parent;
  public Ghost(Tetromino p) {
    super(p.shape);
    setColor(100);
    type="Ghost";
    parent=p;
  }
  
  public void move(int dir) {
     int[][] moves = {{0, 1}, {-1, 0}, {0, -1}, {1, 0}};
     setPos(new int[]{getPos()[0]+moves[dir][0], getPos()[1]+moves[dir][1]});
   }
   
   public boolean rotate(boolean cw) {
     int newIndex;
     if (cw) {
       newIndex=(rotationIndex()+1)%getRotations().length;
     } else {
       newIndex=(rotationIndex()-1+getRotations().length)%getRotations().length;
     }
     setRotationIndex(newIndex);
     return true;
   }
  
  public void drawMino(boolean newBlock) {
    if (newBlock) {
      setPos(parent.getPos());
      while (canMove(MOVE_DOWN)) {
       move(MOVE_DOWN);
      }
    }
     int[][] config = parent.rotations[parent.currentRotation];
     for (int i=0; i<config.length; i++) {
       for (int j=0; j<config[i].length; j++) {
         if (config[i][j]==1) {
           try {
             Box b = grid.getBox(getPos()[0]+i, getPos()[1]+j);
             if (newBlock) {
               if (getPos()[0]!=parent.getPos()[0] || getPos()[1]!=parent.getPos()[1]) {
                 b.setTetromino(this);
                 b.setColor(100);
               }
             } else {
               b.empty();
             }
           } catch (IndexOutOfBoundsException ex) {}
         }
       }
     }
   }
}
