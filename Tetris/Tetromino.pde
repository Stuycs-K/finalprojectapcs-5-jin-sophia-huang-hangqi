 public class Tetromino {
  private color c;
  private char shape;
  private int[][][] rotations;
  private int currentRotation;
  private int[] position; //position of top left corner
  public String type;
  
  public Tetromino() {
    int[] colors={#e39f02, #0f9bd7, #59b101, #d70f37, #e35b02, #2141c6, #af298a};
    char[] shapes = {'O', 'I', 'S', 'Z', 'L', 'J', 'T'};
    int shapeIndex = (int)(7*Math.random());
    c=colors[shapeIndex];
    shape=shapes[shapeIndex];
    currentRotation=0;
    type="Tetromino";
    position = new int[]{-2, 3};
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
      {0, 0, 1, 0}}};   
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
      {0, 1, 0, 0}}};   
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
    
     {{0, 0, 0, 0},
      {0, 1, 0, 0}, 
      {0, 1, 1, 0},
      {0, 1, 0, 0}},
    
     {{0, 0, 0, 0},
      {0, 0, 0, 0}, 
      {1, 1, 1, 0},
      {0, 1, 0, 0}},
    
     {{0, 0, 0, 0},
      {0, 1, 0, 0}, 
      {1, 1, 0, 0},
      {0, 1, 0, 0}}};   
    }
   }
   
   public Tetromino(char s) {
    shape=s;
    currentRotation=0;
    type="Tetromino";
    position = new int[]{-2, 3};
    if (shape=='O') {
      c=#e39f02;
      rotations = new int[][][]
      {{{0, 0, 0, 0},
      {0, 1, 1, 0}, 
      {0, 1, 1, 0},
      {0, 0, 0, 0}}};}
     if (shape=='I') {
       c=#0f9bd7;
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
      c=#59b101;
       rotations = new int[][][]
      {{{0, 0, 0, 0},
      {0, 0, 1, 1}, 
      {0, 1, 1, 0},
      {0, 0, 0, 0}},
    
     {{0, 0, 0, 0},
      {0, 1, 0, 0}, 
      {0, 1, 1, 0},
      {0, 0, 1, 0}}};   
    }
    if (shape=='Z') {
      c=#d70f37;
       rotations = new int[][][]
      {{{0, 0, 0, 0},
      {0, 1, 1, 0}, 
      {0, 0, 1, 1},
      {0, 0, 0, 0}},
    
     {{0, 0, 0, 0},
      {0, 0, 1, 0}, 
      {0, 1, 1, 0},
      {0, 1, 0, 0}}};   
    }
    if (shape=='L') {
      c=#e35b02;
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
      c=#2141c6;
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
      c=#af298a;
       rotations = new int[][][]
      {{{0, 0, 0, 0},
      {0, 1, 0, 0}, 
      {1, 1, 1, 0},
      {0, 0, 0, 0}},
    
     {{0, 0, 0, 0},
      {0, 1, 0, 0}, 
      {0, 1, 1, 0},
      {0, 1, 0, 0}},
    
     {{0, 0, 0, 0},
      {0, 0, 0, 0}, 
      {1, 1, 1, 0},
      {0, 1, 0, 0}},
    
     {{0, 0, 0, 0},
      {0, 1, 0, 0}, 
      {1, 1, 0, 0},
      {0, 1, 0, 0}}};   
    }
   }
   
   public boolean rotate(boolean cw) {
     int newIndex;
     if (cw) {
       newIndex=(currentRotation+1)%rotations.length;
     } else {
       newIndex=(currentRotation-1+rotations.length)%rotations.length;
     }
     int[][] config = rotations[newIndex];
     for (int i=0; i<config.length; i++) {
       for (int j=0; j<config[i].length; j++) {
         if (config[i][j]==1) {
           int row=i+position[0];
           int col=j+position[1];
           try {
             if (grid.getBox(row, col).isNotEmpty()) {
               try {
                 if (rotations[currentRotation][i][j]==0) {
                   return false;
                 }
               } catch (IndexOutOfBoundsException ex) {return false;}
             }
           } catch (IndexOutOfBoundsException ex) {
             if (row>=grid.getHeight()) {return false;}
             if (col<0 || col>=grid.getWidth()) {return false;}
           }
         }
       }
     }
     currentRotation=newIndex;
     return true;
   }
   
   public void drawMino(boolean newBlock) {
     int[][] config = rotations[currentRotation];
     for (int i=0; i<config.length; i++) {
       for (int j=0; j<config[i].length; j++) {
         if (config[i][j]==1) {
           try {
             Box b = grid.getBox(position[0]+i, position[1]+j);
             if (newBlock) {
               b.setTetromino(this);
               b.setColor(c);
             } else {
               b.setTetromino(null);
               b.setColor(0);
             }
           } catch (IndexOutOfBoundsException ex) {}
         }
       }
     }
   }
   
   //w is up, a is left, s is down, d is right
   //but also we're not supposed to be moving up lol
   public boolean canMove(int dir) {
     int[][] moves = {{0, 1}, {-1, 0}, {0, -1}, {1, 0}};
     int[][] config = getRotation();
     for (int i=0; i<config.length; i++) {
       for (int j=0; j<config[i].length; j++) {
         if (config[i][j]==1) {
           int row=i+getPos()[0]+moves[dir][0];
           int col=j+getPos()[1]+moves[dir][1];
           try {
             if (grid.getBox(row, col).isNotEmpty()) {
               try {
                 if (config[i+moves[dir][0]][j+moves[dir][1]]==0) {
                   return false;
                 }
               } catch (IndexOutOfBoundsException ex) {return false;}
             }
           } catch (IndexOutOfBoundsException ex) {
             if (row>=grid.getHeight()) {return false;}
             if (col<0 || col>=grid.getWidth()) {return false;}
           }
         }
       }
     }
     return true;
   }
   
   public void move(int dir) {
     int[][] moves = {{0, 1}, {-1, 0}, {0, -1}, {1, 0}};
       drawMino(false);
       position[0]+=moves[dir][0];
       position[1]+=moves[dir][1];
       drawMino(true);
   }
   
   public int[][] getRotation() {
     return rotations[currentRotation];
   }
   
   public int[] getPos(){
     return position;
   }
   
   public void setPos(int[] pos) {
     position=pos;
   }
   
   public void setColor(color col) {
     c=col;
   }
   
   public String getType() {
     return type;
   }
 }
