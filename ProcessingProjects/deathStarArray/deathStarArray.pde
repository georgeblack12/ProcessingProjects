/*
Name: Dark Side Recruitment
 
 Programmer: George Black 
 
 Date: April 9, 2019
 
 Desrcription: The Dark Side is recruiting programers all across the galaxy! The need
 for programers is at an all time high for the Sith. (This is mostly due to the fact
 Petelo Ren had a temper tantrum recently and killed every single programer that worked 
 for the Empire.) To recruit these programmers, they are showing a film of them 
 destroying other planets in the galaxy with the death star. 
 What you are about to watch is that film. Watch as the dark side shows their dominance 
 and consider joining!...or else.
 #JointheDarkSide
 #interestingandlongStoriesareforsandpeople
 #StarWarsEpisode8WasTrash
 
 programs I used that were not mine. 
 1. https://www.processing.org/examples/star.html  by Ben Fry and Casey Rea
 2. https://www.openprocessing.org/sketch/165593/  by Johnny Dunn
 
 
 psuedocode 
 
 1. display the death Star
 2. display stars
 3.display planets
 4. Have death Star destroy a planets one at a time
 5. Change color of the stars
 6. Display text that says "Join the Dark Side. We have cookies" 
 7. Have sign grow until its width is the screen
 */

float state=0;
float scale=0;
float thyme=0;

Planet naboo; 
Planet tatooine;
Planet hoth;

//part of Blinking Stars by Johnny Dunn
float[] xPos = new float[250];
float[] yPos = new float[250];

void setup() {
  ellipseMode(CENTER);
  size(800, 800, P3D);
  
  naboo = new Planet(width/4-50, ((height*3)/4), 70, color (0, 0, 255), 
    color (32, 178, 170));
    
  tatooine= new Planet(width/4-90, height/4, 50, color(232, 232, 0), 
    color(255, 255, 0));
    
  hoth= new Planet((width*3)/4, ((height*3)/4), 40, 255, color(32, 178, 170));

  ////modification of Blinking Stars by Johnny Dunn.
  for (int i=0; i < 250; i++) {
    xPos[i] = random(-100, 1000);
  }
  for (int i=0; i < 250; i++) {
    yPos[i] = random(-100, 1000);
  }
}

void draw() {
  background(0);
  pushMatrix();
  translate(0, 0, -200);

  //part of stars by by Ben Casey and Casey Reas
  for (int i=0; i < 250; i++) {
    noStroke ();
    
    star(xPos[i], yPos[i], 5, 2, 6);
  }
  popMatrix();

  //draw the Death Star
  pushMatrix();
  translate((width*4)/5, height/4);
  rotate(-PI/8); 
  strokeWeight(1);
  stroke(0);
  fill(170); //grey
  sphere(75);
  popMatrix();

  pushMatrix();
  translate((width*4)/5-65, height/4+25, 75);
  fill(0);
  ellipse(0, 0, 40, 40); //ellipse for the small cirlce in the death star. 
  popMatrix();

  tatooine.display();
  naboo.display();
  hoth.display();

//#creative. Have it so the death star destroys the planets one at a time. 
  if (state==0) {
    naboo.destroy();
  }
  if (state==1) {
    tatooine.destroy();
  }
  if (state==2) {
    hoth.destroy();
  }
  if (state==3) {
    thyme+=0.1;
    pushMatrix();
    translate(50, 400);
    fill(noise(thyme)*100+100, 0, 0);
    scale(scale); 
    textSize(24);
    text("Join the Dark Side! We have Cookies. ", 0, 0);
    scale+=0.005; //The text will appear bigger on the screen as the scale increases.
    popMatrix();
    
  // Once the Words are completely across the screen. The text will stop growing in size
    if (scale>1.5) { 
      scale-=.005;
    }
  }
}
