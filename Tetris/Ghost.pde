public class Ghost extends Tetromino {
  private Tetromino parent;
  public Ghost(Tetromino p) {
    setColor(100);
    type="Ghost";
    parent=p;
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
