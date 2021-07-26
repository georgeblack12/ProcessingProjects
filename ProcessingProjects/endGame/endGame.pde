/*
Name: End Game
 /*
 Programmer: George Black
 
 Date: April 18, 2019
 
 Desrcription: Spoiler alert! Thanos wins...If you want a complete story for this 
 program, I recommend you go see Infinity War. The Avengers are taking on Thanos and they
 are trying to save the universe. However,Thanos is too strong, and Peter Quill kinda 
 sucks (if you know what I'm talking about). You get to experience the power of Thanos 
 by walking through all the Avengers and seeing who will die the closer you get to the 
 infinity stones. Once you get to the stones snap your fingers (click the mouse) 
 to see create chaos. Also, you want to remeber this moment for the rest of your life. 
 Click the mouse or press any key to take some pics along the way. 
 
/* Psuedocode
 1. display space (background image)
 2. display the avengers
 3.display Thanos and the infinity gaunlet
 4.make thanos move horizontally with the mouse
 5. The closer thanos gets to the infinity gauntlet, the more red the people  who will
 die become
 6.if thanos snap fingers when he has the stones it causes chaos
 (if  the mouse is pressed when thanos touches the stones causes 7,8,9 ) 
 7. make people fade away
 8. make background disperse
 9. change everything to black and white and print message
 10. take screenshots if mouse or key is pressed
 */



//variables from example 15-15
PImage img;       
int cellsize = 2; 
int cols, rows;   

//array for marvel characters
PImage[] images=new PImage[14];
Marvel[] avengers= new Marvel[14];

PImage thanosBody;
Marvel thanos;

PImage infinityStones;
Marvel stones;

//gloabal variables used to make it so images will change color and the background will 
//pop out of screen
float t=150;
float d=-10;
float trans=255;
float state=0;
float k=0;

void setup() {
  size(1100, 556, P3D);

  //fromexample 15-15
  img = loadImage("space4.jpeg"); //image for background
  cols = width/cellsize;             // Calculate # of columns
  rows = height/cellsize;   // Calculate # of rows

  //#creative load images of avengers. #creative because I named them in a way I 
  //could call all of the avengers images with a for loop
  for ( int i =0; i<images.length; i++) {
    images[i]=loadImage("image"+i+".png");
  }

  thanosBody=loadImage("thanos.png");
  infinityStones=loadImage("infinityGauntlet.png");

  //put these avengers on the ground
  for (int i=0; i<11; i++) {
    avengers[i] = new Marvel(t, (height*3)/4-25, images[i], 50, 150, trans);
    t=t+75;
  }

  //avengers in the sky
  for (int i =11; i<avengers.length; i++) {
    avengers[i]=new Marvel(d, height/4-170, images[i], 75, 225, 
      trans);
    d=d+500;
  }

  //x values does not matter here because we will the function display.thanos on thanos
  thanos= new Marvel(0, height/2-200, thanosBody, 200, 350, trans); 
  stones=new Marvel((width*3)/4+100, height/2-100, infinityStones, 75, 150, trans);
}


void draw() {
  background(0);

  //from example 15-15
  img.loadPixels(); //load pixels of background
  // Begin loop for columns
  for ( int i = 0; i < cols; i++) {
    // Begin loop for rows
    for ( int j = 0; j < rows; j++) {
      int x = i*cellsize + cellsize/2; // x position
      int y = j*cellsize + cellsize/2; // y position
      int loc = x + y*width;           // Pixel array location
      color c = img.pixels[loc];       // Grab the color
      // # creative. Calculate a z position as function of our k value
      //and pixel brightness. Eventually k will increase causing pixels to seem 
      //like they are floating away
      float z = (k/(float)width) * brightness(img.pixels[loc])- 20.0;

      // Translate to the location, set fill and stroke, and draw the rect for each pixel
      pushMatrix();
      translate(x, y, z);
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize, cellsize);
      popMatrix();
    }
  }

// #creative made it so even images are the characters from the movie that die 
//and even images are the ones that survive
  for (int i=0; i<avengers.length; i++) {
    int remainderI=i%2; 
    if (remainderI==0 ||i==13) {
      avengers[i].displayLive();
    }
    if (remainderI==1 && i !=13) {
      avengers[i].displayRed();
    }
  }
  thanos.displayThanos();
  stones.displayLive();

//if thanos has all the infinity stones and "snaps" his fingers people fade away and
//chaos begins
  if (mouseX>=(width*3)/4 && mousePressed==true) {
    state=1; //by pressing mouse people start to dissapear
  }
  
  //once the background image is close to being off the screen, everything becomes black
  //and white and an image is printed.
  if (k>15000) { 
    filter(THRESHOLD, 0.5); //example 15-11
    textSize(50);
    fill(255);
    text("Thanos Will Return.", width/2-200, height/2);
  }
  
  //takes a screenshot 
  if (mousePressed==true || keyPressed==true) {
    saveFrame();
  }
}
