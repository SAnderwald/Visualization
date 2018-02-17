 

// Angle of rotation around eye
float theta = 0;
PImage img01;
void setup() {
  size(827, 514);
  
}

void draw() {
   tint(255,90);
  img01 = loadImage("img1.JPG");

  image(img01,0,0,width,height);
   
  
 

  // Translation to center of eye
  translate(width/2, height/2);
  noFill();
  noStroke();
  ellipse(0, 0, 200, 200);

  // The large orb around eye
  pushMatrix();
  rotate(theta*2);
  translate(180, 0);
  fill(#86C6FA);
  ellipse(0, 0, 40, 60);

  
  // 1st Orb 
  pushMatrix(); 
  rotate(theta*4);
  translate(90, 5);
  fill(#B9F7D5);
  ellipse(0, 0, 18, 18);
  popMatrix();

  // 2nd Orb
  pushMatrix();
  rotate(theta*3);
  translate(60, 5);
  fill(#A3F5AD);
  ellipse(0, 0, 8, 8);
  popMatrix();
  
// Moon #3 also rotates around the earth
  pushMatrix();
  rotate(theta*2);
  translate(40, 0);
  fill(#BFA3F5);
  ellipse(0, 0, 6, 6);
  popMatrix();
  
  popMatrix();

  theta += 0.01;
}