import toxi.processing.*;
import toxi.data.csv.*;
import toxi.color.*;
import toxi.color.theory.*;
import toxi.geom.*;
import toxi.geom.mesh.*;
import processing.opengl.*;



int numSlices;
float maxRadius=300;
float sliceWidth=10;

DataSlice[] samples;

ToxiclibsSupport gfx;

// Mesh container
TriangleMesh mesh;

void setup() {
  size(1200,900,OPENGL);



  gfx=new ToxiclibsSupport(this);

  String[] lines=loadStrings("HW10B.csv");
  
  String[] fields=split(lines[0],',');
  numSlices=lines.length-1;
  samples=new DataSlice[numSlices];
  float globalMaxValue=0;
  for(int i=1; i<=numSlices; i++) {
    DataSlice data=new DataSlice(lines[i],fields);
    if (data.maxValue>globalMaxValue) {
      globalMaxValue=data.maxValue;
    }
    samples[i-1]=data;
  }
  float normFactor=(float)maxRadius/globalMaxValue;
  // scale all slices accordingly
  for(DataSlice item : samples) {
    item.scale(normFactor);
  }
  // create new mesh container
  mesh=new TriangleMesh();
  // iterate over all slices
  for(int i=0; i<numSlices-1; i++) {
    // connect each slice with its successor
    // curr = vertices of current slice
    Vec2D[] curr=samples[i].vertices;
    // next = vertices of next slice
    Vec2D[] next=samples[i+1].vertices;
    // calculate offsets of each slice
    Vec3D currOffset=new Vec3D(0,0,i*sliceWidth);
    Vec3D nextOffset=new Vec3D(0,0,(i+1)*sliceWidth);
    // iterate over all points of the polygons
    for(int j=0; j<curr.length; j++) {
      int id=j+1;
      if (id==curr.length) {
        id=0;
      }
     
      Vec3D a=curr[j].to3DXY().addSelf(currOffset);
      Vec3D b=curr[id].to3DXY().addSelf(currOffset);
      Vec3D c=next[j].to3DXY().addSelf(nextOffset);
      Vec3D d=next[id].to3DXY().addSelf(nextOffset);
      // create mesh faces (see sketch in comments above)
      mesh.addFace(a,b,c);
      mesh.addFace(c,b,d);
    }
  }
  // center mesh around world origin
  mesh.center(null);
  // save mesh as STL file
  //mesh.saveAsSTL(sketchPath("monday.stl"));
}

void draw() {
  background(#4A67FF);
  lights();
  fill(#B28700);
  
  
  textSize(20);
  text("Daily Price of Bitcoing USD", 90,855);
  text("Price, Open,High", 90, 875);
  text("From 6/11/17 to 8/3/17",90, 895);
 
  translate(width/2,height/2,0);
  
  rotateX(mouseY*0.01);
  rotateY(mouseX*0.01);
  // draw mesh
  gfx.mesh(mesh);
  
}

