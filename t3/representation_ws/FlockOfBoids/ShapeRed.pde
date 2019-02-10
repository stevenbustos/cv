abstract class ShapeRep {
  
  PShape shape;
  ArrayList<PVector> vertices;
  ArrayList<PVector> faces;
  
  color lineColor = color(0, 255, 255);
  color faceColor = color(128, 0, 255, 100);
  int strokeWeight = 3;
    
  abstract void buildShape();
  abstract void drawImmediate();

  void draw() {
    pushStyle();
    strokeWeight(strokeWeight);
    stroke(lineColor);
    fill(faceColor);
    if ( immediate ){ 
      drawImmediate();
    }else{ 
      shape(shape);
    }
    popStyle();
  }
  
}
