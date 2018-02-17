class Planet {
  float radius;
  float distance;
  Planet[] planets;
  float angle;
  float orbitspeed;
  PVector v;
  
  PShape globe;

  Planet(float r, float d, float o, PImage img) {

    v = PVector.random3D();

    radius = r;
    distance = d;
    v.mult(distance);
    angle = 90;
    orbitspeed = o;

    noStroke();
    noFill();
    globe = createShape(SPHERE, radius);
    globe.setTexture(img);
    
  }

  void orbit() {
    //angle = PI+180;
    //angle = angle + orbitspeed;
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        //planets[i].orbit();
      }
    }
  }
  void moons(int total, int level) {
    planets = new Planet[total];
    for (int i = 0; i < planets.length; i++) {
      float r = radius*.25;
      //float r = radius/(level*2);
      float d = radius+100;
      float o = 0.1;
      int index = int(random(0,texture.length));
      planets[i] = new Planet(r, d, o, texture[index]);
      if (level < 2) {
        //int num = int(random(0,3));
        //planets[i].moons(num, level+1);
      }
    }
  }

  void show() {
    pushMatrix();
    noStroke();
    PVector v2 = new PVector(1, 0, 1);
    PVector p = v.cross(v2);
    rotate(angle, p.x, p.y, p.z);
    stroke(255);
    rotateY(frameCount*PI/180);

    translate(v.x, v.y, v.z);
    noStroke();
    fill(255);
    shape(globe);
    rotateY(frameCount*-PI/180);
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    popMatrix();
  }
}