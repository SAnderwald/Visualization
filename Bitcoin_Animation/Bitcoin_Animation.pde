
import ddf.minim.*;  
Minim minim;       
AudioPlayer song;    


import peasy.*;
Planet earth;

PeasyCam cam;

PImage earthTexture;
PImage[] texture = new PImage[1];



void setup() {
  size(800,800, P3D);
  earthTexture = loadImage("earth.jpg");
  texture[0] = loadImage("bitcoin.jpg");
  
  
  
  cam = new PeasyCam(this,500);
  earth = new Planet(100,0,0, earthTexture);
  earth.moons(1,1);
  
   minim = new Minim(this);
  song = minim.loadFile("Apprentice.mp3");
  song.play();
  
  
  
}
void draw(){
  background(0);
  ambientLight(255,255,255);
  pointLight(255,255,255,0,0,0);
  earth.show();
  earth.orbit();
  
}
  
 void keyPressed()
{
  if(key == 's')
  {
    song.pause(); //if S key is pressed, stop the song
  }
  
  if(key == 'p')
  {
    song.play(); //if P key is pressed, play the song
  }
}