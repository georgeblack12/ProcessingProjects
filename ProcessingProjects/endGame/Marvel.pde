class Marvel {
  //Marvel's varaibles
  float x;
  float y;
  float widthI;
  float heightI;
  PImage img;
  float trans;

  //Marvel's constructor
  Marvel(float tempX, float tempY, PImage tempImg, float tempWidthI, float tempHeightI, 
    float tempTrans) {

    x=tempX;
    y=tempY;
    img=tempImg;
    widthI=tempWidthI;
    heightI=tempHeightI;
    trans=tempTrans;
  }

  //what the living haracters do, just stay there.
  void displayLive() {
    tint(255);
    image(img, x, y, widthI, heightI);
  }

  //what happens to dieing characters
  void displayRed() {
    //the closer thanos gets to the infinity stones the more you see who will
    //probably die by having those characters become more red.
    //exercise 15-3
    tint(255, map(mouseX, 0, width, 255, 0), map(mouseX, 0, width, 255, 0), trans);
    image(img, x, y, widthI, heightI);

    //if the mouse is pressed state=1, so if the mouse is pressed people start to fade
    //away
    if (state==1) {
      trans=trans-5;
    }
    //once the people have dissapeared the background image start to float away
    if (trans<=0) {
      k=k+50;
    }
  }

  //thanos moves horizontally with the x location of the mouse.
  void displayThanos() {
    tint(255);
    image(img, mouseX-100, y, widthI, heightI);
  }
}
