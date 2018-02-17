
PImage img;

PFont titleFont, labelFont;

String[] Bitcoin = {"Bitcoin", "Ethereum", "Ripple", "Litecoin", "Ethereum Classic", "Dash", "NEM", "IOTA","Other"};

int[] marketCap = {44, 24, 10, 3, 2, 1, 1, 1, 14};
String[] BitCoinNames = {"Bitcoin", "Ethereum", "Ripple", "Litecoin", "Ethereum Classic", "Dash", "NEM", "IOTA","Other"};


void setup() {
  size(800, 400);
  titleFont = loadFont("GillSans-Bold-18.vlw");
  labelFont = loadFont("GillSans-12.vlw");
  smooth();
  rectMode(CENTER);
}

void draw() {
  img = loadImage("blockchain.jpg");
  background(0);
  tint(100, 200);
  image(img,0,0,width,height);
  noStroke();
  
  // Market data on Bitcoin
  int bb = 50;   // Bottom border
  int lb = 50;  // Left side border
  
  for(int i = 0; i < Bitcoin.length; i++) {
    int w = 30;    // Width of bars
    int s = 50;    // Space between bars
    int[] t  = new int[Bitcoin.length]; // Tall (for bars)
    t[i] = marketCap[i] * 5;
    int[] x = new int[Bitcoin.length];
    x[i] = int(lb + (i + .5) * (w + s));
    int[] y = new int[Bitcoin.length];
    y[i] = height - bb - t[i]/2;
    
    if((mouseX > (x[i] - w/2)) && (mouseX < (x[i] + w/2)) &&
       (mouseY > (y[i] - t[i]/2)) && (mouseY < (y[i] + w/2))) {
       fill(#FFBA00);
       
       textFont(labelFont);
       textAlign(CENTER);
       // Info on rollover...
       text(BitCoinNames[i] + ": " + marketCap[i], x[i], y[i] - t[i]/2 - 14);
      


  //else statements turns bar gray if not within the rect
    } else {
    fill(#28A599);
    }
    rect(x[i], y[i], w, t[i]);
  
    textAlign(CENTER);
    textFont(labelFont);
    fill(#CCCCCC);
    text(Bitcoin[i], x[i], height - bb/14);
  }
  
  stroke(#CCCCCC);
  textFont(labelFont);
  textAlign(RIGHT, CENTER);
  for(int i = 0; i < 50; i++) {
    //int y = height - bb - i * 10;
    //line(lb - 5, y, lb - 8, y);
    //text(i, lb - 15, y);
  }
  
  textAlign(CENTER);
  textFont(titleFont);
  text("Percentage of Market Cap in USD", width/2, 30);
}
