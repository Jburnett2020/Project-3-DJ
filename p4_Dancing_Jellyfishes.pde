
/*Biophilia is the love of life or living things and using nature or natural 
elements into a built environment*/

/*Technophilia is the love of technology and how to think of technology using 
a big picture with positive feelings about different technologies */

Dancing w;// changed World to Atlantis
int maxjellyfishes = 10000; //changed maxcells to maxjellyfishes and 80000 to 100000
int numjellyfishes; // changed numcells to numjellyfishes
Jellyfish[] jellyfishes = new Jellyfish[maxjellyfishes]; //changed Cell[] cells = 
// new Cell[maxcells] to Jellyfish[] jellyfishes = new Jellyfish[maxjellyfishes]
color bloom1, bloom2, bloom3, bloom4; 
color bg = color(0, 62, 120); //changed black to bg
int runs_per_loop = 20000; // changed 10000 to 200000

void setup()
{
  size(640, 360);
  frameRate(24);
  reset();
}

void reset() {
  clearScreen();
  w = new Dancing();
  bloom1 = color(136, 105, 145);
  bloom2 = color(187, 144, 200);
  bloom3 = color(210, 162, 217);
  bloom4 = color(236, 216, 239);
  numjellyfishes = 0;
  dancing_jellyfishes();
}

void dancing_jellyfishes() //changed seed to dancing_jellyfishes
{
  // Add jellyfishes at random places
  for (int i = 0; i < maxjellyfishes; i++)
  {
    int jX = int(random(width));
    int jY = int(random(height));
    int j;
    float r = random(1);
    if (r < 0.25) j = bloom1;
    else if (r < 0.5) j = bloom2;
    else if (r < 0.75) j = bloom3;
    else j = bloom4;
    if (w.getjelly(jX, jY) == bg)
    {
      w.setjelly(jX, jY, j);
      jellyfishes[numjellyfishes] = new Jellyfish(jX, jY);
      numjellyfishes++;
    }
  }
}

void draw() {
  // Run jellyfish in random order
  for (int i = 0; i < runs_per_loop; i++) {
    int selected = min((int)random(numjellyfishes), numjellyfishes - 1);
    jellyfishes[selected].run();
  }
}

void clearScreen() {
  background(0, 62, 120);
}

class Jellyfish {
  int x, y;
  Jellyfish(int xin, int yin) {
    x = xin;
    y = yin;
  }
  
  // Perform action based on surroundings
  void run() {
    // Fix Jellyfish coordinates
    while(x < 0) {
      x += width;
    }
    while(x > width - 1) {
      x -= width;
    }
    while(y < 0) {
      y += height;
    }
    while(y > height - 1) {
      y -= height;
    }

    // Jellyfish instructions
    int mySquishy = w.getjelly(x, y);
    if (mySquishy == bloom1) {
      if (w.getjelly(x - 1, y + 1) == bg && w.getjelly(x + 1, y + 1) == bg && w.getjelly(x, y + 1) == bg) move(0, 1);
      else if (w.getjelly(x - 1, y) == bloom2 && w.getjelly(x - 1, y - 1) != bg) move(0, -1);
      else if (w.getjelly(x - 1, y) == bloom2 && w.getjelly(x - 1, y - 1) == bg) move(-1, -1);
      else if (w.getjelly(x + 1, y) == bloom1 && w.getjelly(x + 1, y - 1) != bg) move(0, -1);
      else if (w.getjelly(x + 1, y) == bloom1 && w.getjelly(x + 1, y - 1) == bg) move(1, -1);
      else move((int)random(4) - 1, 0);
    } else if (mySquishy == bloom2) {
      if (w.getjelly(x - 1, y + 1) == bg && w.getjelly(x + 1, y + 1) == bg && w.getjelly(x, y + 1) == bg) move(0, 1);
      else if (w.getjelly(x + 1, y) == bloom1 && w.getjelly(x + 1, y - 1) != bg) move(0, -1);
      else if (w.getjelly(x + 1, y) == bloom1 && w.getjelly(x + 1, y - 1) == bg) move(1, -1);
      else if (w.getjelly(x - 1, y) == bloom2 && w.getjelly(x - 1, y - 1) != bg) move(0, -1);
      else if (w.getjelly(x - 1, y) == bloom2 && w.getjelly(x - 1, y - 1) == bg) move(-1, -1);
      else move((int)random(4) - 1, 0); //changed 3 to 4
    }
    else if (mySquishy == bloom3)
    {
      if (w.getjelly(x - 1, y - 1) == bg && w.getjelly(x + 1, y - 1) == bg && w.getjelly(x, y - 1) == bg) move(0, -1);
      else if (w.getjelly(x - 1, y) == bloom4 && w.getjelly(x - 1, y + 1) != bg) move(0, 1);
      else if (w.getjelly(x - 1, y) == bloom4 && w.getjelly(x - 1, y + 1) == bg) move(-1, 1);
      else if (w.getjelly(x + 1, y) == bloom3 && w.getjelly(x + 1, y + 1) != bg) move(0, 1);
      else if (w.getjelly(x + 1, y) == bloom3 && w.getjelly(x + 1, y + 1) == bg) move(1, 1);
      else move((int)random(4) - 1, 0); //changed 3 to 4
    }
    else if (mySquishy == bloom4)
    {
      if (w.getjelly(x - 1, y - 1) == bg && w.getjelly(x + 1, y - 1) == bg && w.getjelly(x, y - 1) == bg) move(0, -1);
      else if (w.getjelly(x + 1, y) == bloom3 && w.getjelly(x + 1, y + 1) != bg) move(0, 1);
      else if (w.getjelly(x + 1, y) == bloom3 && w.getjelly(x + 1, y + 1) == bg) move(1, 1);
      else if (w.getjelly(x - 1, y) == bloom4 && w.getjelly(x - 1, y + 1) != bg) move(0, 1);
      else if (w.getjelly(x - 1, y) == bloom4 && w.getjelly(x - 1, y + 1) == bg) move(-1, 1);
      else move((int)random(4) - 1, 0); //changed 3 to 4
    }
  }
  
  // Will move the jellyfish (dx, dy) units if that space is empty
  void move(int dx, int dy) {
    if (w.getjelly(x + dx, y + dy) == bg) {
      w.setjelly(x + dx, y + dy, w.getjelly(x, y));
      w.setjelly(x, y, color(0, 62, 120));
      x += dx;
      y += dy;
    }
  }
}

/*  The Dancing class simply provides two functions, get and set, which access the
  display in the same way as getjelly and setjelly.  The only difference is that
  the Dancing class's get and set do screen wrap around ("toroidal coordinates").
  */
class Dancing {
  
  void setjelly(int x, int y, int j) {
    while(x < 0) x += width;
    while(x > width - 1) x -= width;//changed 1 to 2
    while(y < 0) y += height;
    while(y > height - 1) y -= height;
    set(x, y, j);
  }
  
  color getjelly(int x, int y) {
    while(x < 0) x += width;
    while(x > width - 1) x -= width;//changed 1 to 2
    while(y < 0) y += height;
    while(y > height - 1) y -= height;
    return get(x, y);
  }
}

void mousePressed() {
  reset();
}


///////////////////////////////
////////erasure poem///////////
//////Dancing Jellyfishes//////
///////////////////////////////
/*
Dancing   
       jellyfishes   10000 
       jellyfishes
Jellyfish[] jellyfishes                [             ]
 o o  bloom   bloom   bloom   bloom   
 o o        o o (          )
        _   _ oo    20000 

 o      up()

      (  0,   0);
           (  );
       ();


          () 
             ();
          Dancing();
  bloom  =  o o (136          );
  bloom  =  o o (     144     );
  bloom  =  o o (          217);
  bloom  =  o o (     216     );
     jellyfishes   0
  dancing jellyfishes();


 o   dancing_jellyfishes()


   o  (      = 0; i < maxjellyfishes; i++)
  
        jX =    (    o (     ));
        jY =    (    o (      ));
        j
    float   =     o (1)
    ;
       (  < 0   ) j = bloom
            (  < 0  ) j = bloom
            (  < 0   ) j = bloom
         j = bloom  
       (  getjelly(jX, jY) ==   )
    
        setjelly(jX, jY, j);
      jellyfishes[   jellyfishes] =     Jellyfish(jX, jY);
         jellyfishes++;
    
  


 o       () 
   o  (      = 0    <     _   _ oo    ++) {
                 =    ((   )    o (   jellyfishes),    jellyfishes - 1);
    jellyfishes[        ]    () 
  


 o              () {
        o   (0        0);


      Jellyfish 
      x  y
  Jellyfish(    x  ,     y  ) 
    x = x  
    y = y  
  
  
   o      () 
         (x < 0) 
      x +=      ;
    
         (x >       -  ) 
      x -=      ;
    
         (y < 0) 
      y += 
    
         (y >        -  ) 
      y -= 


           o o  =      jelly(x  y);
       (mySquishy == bloom )  
         (     jelly(x - 1, y + 1) ==    &&  .   jelly(x + 1, y + 1) ==    &&  .   jelly(x, y + 1) ==   )  o  (0, 1)
              ( .   jelly(x - 1, y) == bloom  &&  .   jelly(x - 1, y - 1) !=   )  o  (0, -1);
              ( .   jelly(x - 1, y) == bloom  &&  .   jelly(x - 1, y - 1) ==   )  o  (-1, -1);
              ( .   jelly(x + 1, y) == bloom  &&  .   jelly(x + 1, y - 1) !=   )  o  (0, -1);
              ( .   jelly(x + 1, y) == bloom  &&  .   jelly(x + 1, y - 1) ==   )  o  (1, -1);
            o  ((   )    o (4) - 1, 0);
              (mySquishy == bloom )  
         ( .   jelly(x - 1, y + 1) ==    &&  .   jelly(x + 1, y + 1) ==    &&  .   jelly(x, y + 1) ==   )  o  (0, 1)
              ( .   jelly(x + 1, y) == bloom  &&  .   jelly(x + 1, y - 1) !=   )  o  (0, -1);
              ( .   jelly(x + 1, y) == bloom  &&  .   jelly(x + 1, y - 1) ==   )  o  (1, -1);
              ( .   jelly(x - 1, y) == bloom  &&  .   jelly(x - 1, y - 1) !=   )  o  (0, -1);
              ( .   jelly(x - 1, y) == bloom  &&  .   jelly(x - 1, y - 1) ==   )  o  (-1, -1);
            o  ((   )    o (4) - 1, 0);
    
            (mySquishy == bloom )
    
         ( .  jelly(x - 1, y - 1) ==    &&  .   jelly(x + 1, y - 1) ==    &&  .   jelly(x, y - 1) ==   )  o  (0, -1)
              ( .getjelly(x - 1, y) == bloom  &&  .   jelly(x - 1, y + 1) != bg) move(0, 1);
              ( .getjelly(x - 1, y) == bloom  &&  .   jelly(x - 1, y + 1) == bg) move(-1, 1);
              ( .getjelly(x + 1, y) == bloom  &&  .   jelly(x + 1, y + 1) != bg) move(0, 1);
              ( .getjelly(x + 1, y) == bloom  &&  .   jelly(x + 1, y + 1) == bg) move(1, 1);
            o  ((   )    o (4) - 1, 0);
    
            (mySquishy == bloom )
    
         ( .   jelly(x - 1, y - 1) ==    &&  .   jelly(x + 1, y - 1) ==    &&  .   jelly(x, y - 1) ==   )  o  (0, -1)
              ( .   jelly(x + 1, y) == bloom  &&  .   jelly(x + 1, y + 1) !=   )  o  (0, 1);
              ( .   jelly(x + 1, y) == bloom  &&  .   jelly(x + 1, y + 1) ==   )  o  (1, 1);
              ( .   jelly(x - 1, y) == bloom  &&  .   jelly(x - 1, y + 1) !=   )  o  (0, 1);
              ( .   jelly(x - 1, y) == bloom  &&  .   jelly(x - 1, y + 1) ==   )  o  (-1, 1);
            o  ((   )    o (4) - 1, 0); 
    
  
  
   o    o  (    dx,     dy) {
       ( .   jelly(x + dx, y + dy) ==   ) 
       .   jelly(x + dx, y + dy,  .   jelly(x, y));
       .   jelly(x, y,  o o (0, 62, 120));
      x += dx;
      y += dy;
    
  


      Dancing 
  
   o      jelly(    x      y      j) 
         (x < 0) x += 
         (x >       - 1) x -= 
         (y < 0) y += 
         (y >        - 1) y -= 
       (x  y  j);
  
  
   o o     jelly(    x      y) 
         (x < 0) x += 
         (x >       - 1) x -= 
         (y < 0) y += 
         (y >        - 1) y -= 
              (x  y) 
  


 o    o          () 
       ();

*/