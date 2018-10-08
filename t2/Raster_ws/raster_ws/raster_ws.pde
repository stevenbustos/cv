import frames.timing.*;
import frames.primitives.*;
import frames.core.*;
import frames.processing.*;

// 1. Frames' objects
Scene scene;
Frame frame;
Vector v1, v2, v3;
// timing
TimingTask spinningTask;
boolean yDirection;
// scaling is a power of 2
int n = 4;

// 2. Hints
boolean triangleHint = true;
boolean gridHint = true;
boolean debug = true;

// 3. Use FX2D, JAVA2D, P2D or P3D
String renderer = P3D;

void setup() {
  //use 2^n to change the dimensions
  size(1024, 1024, renderer);
  scene = new Scene(this);
  if (scene.is3D())
    scene.setType(Scene.Type.ORTHOGRAPHIC);
  scene.setRadius(width/2);
  scene.fitBallInterpolation();

  // not really needed here but create a spinning task
  // just to illustrate some frames.timing features. For
  // example, to see how 3D spinning from the horizon
  // (no bias from above nor from below) induces movement
  // on the frame instance (the one used to represent
  // onscreen pixels): upwards or backwards (or to the left
  // vs to the right)?
  // Press ' ' to play it
  // Press 'y' to change the spinning axes defined in the
  // world system.
  spinningTask = new TimingTask() {
    @Override
    public void execute() {
      scene.eye().orbit(scene.is2D() ? new Vector(0, 0, 1) :
        yDirection ? new Vector(0, 1, 0) : new Vector(1, 0, 0), PI / 100);
    }
  };
  scene.registerTask(spinningTask);

  frame = new Frame();
  frame.setScaling(width/pow(2, n));

  // init the triangle that's gonna be rasterized
  randomizeTriangle();
}

void draw() {
  background(0);
  stroke(0, 255, 0);
  if (gridHint)
    scene.drawGrid(scene.radius(), (int)pow(2, n));
  if (triangleHint)
    drawTriangleHint();
  pushMatrix();
  pushStyle();
  scene.applyTransformation(frame);
  triangleRaster();
  popStyle();
  popMatrix();
}
float edgeFunction(float ax, float ay,float bx,float by,float cx,float cy){
  return (cx- ax) * (by - ay) - (cy - ay) * (bx - ax);
}
void fillPixel(float R,float G,float B,int i, int j){
   pushStyle();
   colorMode(RGB, 1);
   noStroke();
   fill(R,G,B);
   rect(i,j,1,1);
   popStyle();
}
// Implement this function to rasterize the triangle.
// Coordinates are given in the frame system which has a dimension of 2^n
void triangleRaster() {
  // frame.location converts points from world to frame
  // here we convert v1 to illustrate the idea
  float x1 = frame.location(v1).x();
  float x2 = frame.location(v2).x();
  float x3 = frame.location(v3).x();

  float y1 = frame.location(v1).y();
  float y2 = frame.location(v2).y();
  float y3 = frame.location(v3).y();
  float E12A, E23A, E31A,E12B,E23B, E31B,E12C,E23C, E31C,Area,R,G,B;
  Area = edgeFunction(x1,y1,x2,y2,x3,y3);
  for(int i=-round(pow(2,n-1)); i<pow(2,n-1);i++){
     for(int j=-round(pow(2,n)/2); j<round(pow(2,n)/2);j++){
       E12A = edgeFunction(x1,y1,x2,y2,i+0.25,j+0.5);
       E23A = edgeFunction(x2,y2,x3,y3,i+0.25,j+0.5);
       E31A = edgeFunction(x3,y3,x1,y1,i+0.25,j+0.5);
       E12B = edgeFunction(x1,y1,x2,y2,i+0.5,j+0.5);
       E23B = edgeFunction(x2,y2,x3,y3,i+0.5,j+0.5);
       E31B = edgeFunction(x3,y3,x1,y1,i+0.5,j+0.5);
       E12C = edgeFunction(x1,y1,x2,y2,i+0.75,j+0.5);
       E23C = edgeFunction(x2,y2,x3,y3,i+0.75,j+0.5);
       E31C = edgeFunction(x3,y3,x1,y1,i+0.75,j+0.5);
       if(((E12A>=0 && E23A>=0 && E31A>=0)&&(E12C>=0 && E23C>=0 && E31C>=0))||((E12A<=0 && E23A<=0 && E31A<=0)&&(E12C<=0 && E23C<=0 && E31C<=0))){
         R = E12B /Area;
         G = E23B /Area;
         B = E31B /Area;
         fillPixel(R,G,B,i,j);
        }else{
          if((E12B>=0 && E23B>=0 && E31B>=0)||(E12B<=0 && E23B<=0 && E31B<=0)){
            R = E12B /Area;
            G = E23B /Area;
            B = E31B /Area;
            if((E12A>=0 && E23A>=0 && E31A>=0)||(E12A<=0 && E23A<=0 && E31A<=0)){
             R = ((E12A /Area)+R)/2;
             G = ((E23A /Area)+G)/2;
             B = ((E31A /Area)+B)/2;
            }else{
             R = (R*0.8)/2;
             G = (G*0.8)/2;
             B = (B*0.8)/2;
            }
            if((E12C>=0 && E23C>=0 && E31C>=0)||(E12C<=0 && E23C<=0 && E31C<=0)){
             R = ((E12C /Area)+R)/2;
             G = ((E23C /Area)+G)/2;
             B = ((E31C /Area)+B)/2;
            }else{
             R = (R*0.8)/2;
             G = (G*0.8)/2;
             B = (B*0.8)/2;
            }            
            fillPixel(R,G,B,i,j);
          }else{
           if((E12A>=0 && E23A>=0 && E31A>=0)||(E12A<=0 && E23A<=0 && E31A<=0)){
            R = E12A /Area;
            G = E23A /Area;
            B = E31A /Area;
            if((E12C>=0 && E23C>=0 && E31C>=0)||(E12C<=0 && E23C<=0 && E31C<=0)){
             R = ((E12C /Area)+R)/2;
             G = ((E23C /Area)+G)/2;
             B = ((E31C /Area)+B)/2;
            }else{
             R = (R*0.8)/2;
             G = (G*0.8)/2;
             B = (B*0.8)/2;
            }
             R = (R*0.8)/2;
             G = (G*0.8)/2;
             B = (B*0.8)/2;
            fillPixel(R,G,B,i,j);
           }else{
            if((E12C>=0 && E23C>=0 && E31C>=0)||(E12C<=0 && E23C<=0 && E31C<=0)){
            R = E12C /Area;
            G = E23C /Area;
            B = E31C /Area;
             R = (R*1.6)/3;
             G = (G*1.6)/3;
             B = (B*1.6)/3;
            fillPixel(R,G,B,i,j);
           }
          }
        }
        }
        if (debug) {
    pushStyle();
    stroke(255, 255, 0, 125);
    point(round(frame.location(v1).x()), round(frame.location(v1).y()));
    popStyle();
  }
      }
  }
  
}

void randomizeTriangle() {
  int low = -width/2;
  int high = width/2;
  v1 = new Vector(random(low, high), random(low, high));
  v2 = new Vector(random(low, high), random(low, high));
  v3 = new Vector(random(low, high), random(low, high));
}

void drawTriangleHint() {
  pushStyle();
  noFill();
  strokeWeight(2);
  stroke(255, 0, 0);
  triangle(v1.x(), v1.y(), v2.x(), v2.y(), v3.x(), v3.y());
  strokeWeight(5);
  stroke(0, 255, 255);
  point(v1.x(), v1.y());
  point(v2.x(), v2.y());
  point(v3.x(), v3.y());
  popStyle();
}

void keyPressed() {
  if (key == 'g')
    gridHint = !gridHint;
  if (key == 't')
    triangleHint = !triangleHint;
  if (key == 'd')
    debug = !debug;
  if (key == '+') {
    n = n < 7 ? n+1 : 2;
    frame.setScaling(width/pow( 2, n));
  }
  if (key == '-') {
    n = n >2 ? n-1 : 7;
    frame.setScaling(width/pow( 2, n));
  }
  if (key == 'r')
    randomizeTriangle();
  if (key == ' ')
    if (spinningTask.isActive())
      spinningTask.stop();
    else
      spinningTask.run(20);
  if (key == 'y')
    yDirection = !yDirection;
}
