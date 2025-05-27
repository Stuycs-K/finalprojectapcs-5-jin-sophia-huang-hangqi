public class Tetromino {
  private color c;
  private char shape;
  private int[][][] rotations;
  private int currentRotation;
  private int[] position; //position of top left corner
  
  public Tetromino() {
    int[] colors={#e39f02, #0f9bd7, #59b101, #d70f37, #e35b02, #2141c6, #af298a};
    char[] shapes = {'O', 'I', 'S', 'Z', 'L', 'J', 'T'};
    int type = (int)(7*Math.random());
    c=colors[type];
    shape=shapes[type];
    currentRotation=0;
    position = new int[]{0, 3};
    if (shape=='O') {
      rotations = new int[][][]
      {{{0, 0, 0, 0},
      {0, 1, 1, 0}, 
      {0, 1, 1, 0},
      {0, 0, 0, 0}}};}
     if (shape=='I') {
       rotations = new int[][][]
      {{{0, 0, 0, 0},
      {1, 1, 1, 1}, 
      {0, 0, 0, 0},
      {0, 0, 0, 0}},
    
     {{0, 0, 1, 0},
      {0, 0, 1, 0}, 
      {0, 0, 1, 0},
      {0, 0, 1, 0}},
    
     {{0, 0, 0, 0},
      {0, 0, 0, 0}, 
      {1, 1, 1, 1},
      {0, 0, 0, 0}},
    
     {{0, 1, 0, 0},
      {0, 1, 0, 0}, 
      {0, 1, 0, 0},
      {0, 1, 0, 0}}};   
    }
    if (shape=='S') {
       rotations = new int[][][]
      {{{0, 0, 0, 0},
      {0, 0, 1, 1}, 
      {0, 1, 1, 0},
      {0, 0, 0, 0}},
    
     {{0, 0, 0, 0},
      {0, 1, 0, 0}, 
      {0, 1, 1, 0},
      {0, 0, 1, 0}},
    
     {{0, 0, 0, 0},
      {0, 1, 1, 0}, 
      {1, 1, 0, 0},
      {0, 0, 0, 0}},
    
     {{0, 1, 0, 0},
      {0, 1, 1, 0}, 
      {0, 0, 1, 0},
      {0, 0, 0, 0}}};   
    }
    if (shape=='Z') {
       rotations = new int[][][]
      {{{0, 0, 0, 0},
      {0, 1, 1, 0}, 
      {0, 0, 1, 1},
      {0, 0, 0, 0}},
    
     {{0, 0, 0, 0},
      {0, 0, 1, 0}, 
      {0, 1, 1, 0},
      {0, 1, 0, 0}},
    
     {{0, 0, 0, 0},
      {1, 1, 0, 0}, 
      {0, 1, 1, 0},
      {0, 0, 0, 0}},
    
     {{0, 0, 1, 0},
      {0, 1, 1, 0}, 
      {0, 1, 0, 0},
      {0, 0, 0, 0}}};   
    }
    if (shape=='L') {
       rotations = new int[][][]
      {{{0, 0, 0, 0},
      {0, 1, 0, 0}, 
      {0, 1, 0, 0},
      {0, 1, 1, 0}},
    
     {{0, 0, 0, 0},
      {1, 1, 1, 0}, 
      {1, 0, 0, 0},
      {0, 0, 0, 0}},
    
     {{0, 1, 1, 0},
      {0, 0, 1, 0}, 
      {0, 0, 1, 0},
      {0, 0, 0, 0}},
    
     {{0, 0, 0, 0},
      {0, 0, 0, 1}, 
      {0, 1, 1, 1},
      {0, 0, 0, 0}}};   
    }
    if (shape=='J') {
       rotations = new int[][][]
      {{{0, 0, 0, 0},
      {0, 0, 1, 0}, 
      {0, 0, 1, 0},
      {0, 1, 1, 0}},
    
     {{0, 0, 0, 0},
      {1, 0, 0, 0}, 
      {1, 1, 1, 0},
      {0, 0, 0, 0}},
    
     {{0, 1, 1, 0},
      {0, 1, 0, 0}, 
      {0, 1, 0, 0},
      {0, 0, 0, 0}},
    
     {{0, 0, 0, 0},
      {0, 1, 1, 1}, 
      {0, 0, 0, 1},
      {0, 0, 0, 0}}};   
    }
    if (shape=='T') {
       rotations = new int[][][]
      {{{0, 0, 0, 0},
      {0, 1, 0, 0}, 
      {1, 1, 1, 0},
      {0, 0, 0, 0}},
    
     {{0, 1, 0, 0},
      {0, 1, 1, 0}, 
      {0, 1, 0, 0},
      {0, 0, 0, 0}},
    
     {{0, 0, 0, 0},
      {0, 1, 1, 1}, 
      {0, 0, 1, 0},
      {0, 0, 0, 0}},
    
     {{0, 0, 0, 0},
      {0, 0, 1, 0}, 
      {0, 1, 1, 0},
      {0, 0, 1, 0}}};   
    }
   }
   
   public boolean rotate(boolean cw) {
     if (cw) {
       drawMino(false);
       currentRotation=(currentRotation+1)%rotations.length;
       drawMino(true);
     } else {
       drawMino(false);
       currentRotation=(currentRotation-1+rotations.length)%rotations.length;
       drawMino(true);
     }
     return true;
   }
   
   public void drawMino(boolean newBlock) {
     int[][] config = rotations[currentRotation];
     for (int i=0; i<config.length; i++) {
       for (int j=0; j<config[i].length; j++) {
         if (i==1) {
           Box b = grid.getBox(position[0]+i, position[1]+j);
           if (newBlock) {
              grid.setBox(position[0]+i, position[1]+j, new Box(c, b.getPosition(), b.size));
           } else {
             grid.setBox(position[0]+i, position[1]+j, new Box(0, b.getPosition(), b.size));
           }
         }
       }
     }
   }
   
   //0 is right, 1 is up, 2 is left, 3 is down
   //but also we're not supposed to be moving up lol
   public boolean canMove(int dir) {
     int[][] moves = {{0, 1}, {-1, 0}, {0, -1}, {1, 0}};
     int[][] config = rotations[currentRotation];
     for (int i=0; i<config.length; i++) {
       for (int j=0; j<config[i].length; j++) {
         if (i==1) {
           int row=i+position[0]+moves[dir][0];
            int col=j+position[1]+moves[dir][1];
           try {
             if (grid.getBox(row, col).isNotEmpty()) {
               return false;
             }
           } catch (IndexOutOfBoundsException ex) {
             if (row>grid.getHeight()) {return false;}
             if (col<0 && col>grid.getWidth()) {return false;}
           }
         }
       }
     }
     return true;
   }
 }
