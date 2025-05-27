public class Tetromino {
  private color c;
  private char shape;
  private int[][][] rotations;
  private int currentRotation;
  private int[] position;
  
  public Tetromino() {
    int[] colors={0, 0, 0, 0, 0, 0, 0};
    char[] shapes = {'O', 'I', 'S', 'Z', 'L', 'I', 'T'};
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
       currentRotation=(currentRotation+1)%rotations.length;
     } else {
       currentRotation=(currentRotation-1+rotations.length)%rotations.length;
     }
     return true;
   }
   
   public void drawMino() {
     int[][] config = rotations[currentRotation];
     for (int i=0; i<config.length; i++) {
       for (int j=0; j<config[i].length; j++) {
         if (i==1) {
           Box b = grid.getBox(position[0]+i, position[1]+j);
           grid.setBox(position[0]+i, position[1]+j, new Box(c, b.getPosition(), b.size));
         }
       }
     }
   }
 }
