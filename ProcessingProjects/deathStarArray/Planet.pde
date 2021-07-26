class Planet {
  float x;
  float y;
  float radius;
  color planetStroke;
  color planetColor;
  float planetTheta=0;
  float planetTheta2=-PI/2;
  float time=0;

  Planet(float tempX, float tempY, float tempRadius, color tempPlanetColor, 
    color tempPlanetStroke) {
    x=tempX;
    y=tempY;
    radius=tempRadius;
    planetColor=tempPlanetColor;
    planetStroke=tempPlanetStroke;
    } 
    
  void display() {
    planetTheta=planetTheta+.01;
    pushMatrix();
    translate(x, y,76);
    rotateY(planetTheta/2);
    strokeWeight(1);
    stroke(planetStroke);
    fill(planetColor);
    sphere(radius);
    popMatrix();
  }
  void destroy() {
    time+=0.1; // to make it so color is moving back and forth
    planetTheta2+=0.01; // to make planet spin
    strokeWeight(5);
    stroke(0, (noise(time)*100)+100, 0);
    pushMatrix();
    translate(0,0,75);
    
    //a ray shoots to destroy the planets
    line((width*4)/5-67, height/4+25, map(sin(planetTheta2), -1, 1, (width*4)/5-67, x), 
      map(sin(planetTheta2), -1, 1, height/4+25, y));
      popMatrix();
      
      //if the planet is hit by the ray it is destroyed. (becomes black)
    if (planetTheta2>=PI/2) {
      planetStroke=0;
      planetColor=0;
    }
    
    //after a ray destroys one planet it goes on to destroy the next planet
    if (planetTheta2>PI*3/5) {
      planetTheta2=-PI/2;
      state=state+1;
    }
  }
}
