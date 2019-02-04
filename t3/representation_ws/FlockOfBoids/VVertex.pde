class VVertex extends ShapeRep{

  float sc;
  VVertex(float s){
    sc = s;
    buildShape();
    shape.disableStyle();
  }


  void buildShape() {
    vertices= new ArrayList<PVector>();
    PVector X1 = new PVector(3*sc, 0, 0);
    PVector X2 = new PVector(-3*sc, 0, 0);
    PVector Y1 = new PVector(0, 3*sc, 0);
    PVector Y2 = new PVector(0, -3*sc, 0);
    PVector Z1 = new PVector(0, 0, 3*sc);
    PVector Z2 = new PVector(0, 0, -3*sc);

    vertices.add(X1);
    vertices.add(X2);
    vertices.add(Y1);
    vertices.add(Y2);
    vertices.add(Z1);
    vertices.add(Z2);


    shape = createShape();
    shape.beginShape(TRIANGLE_STRIP);

    shape.vertex(vertices.get(0).x, vertices.get(0).y, vertices.get(0).z);
    shape.vertex(vertices.get(2).x, vertices.get(2).y, vertices.get(2).z);
    shape.vertex(vertices.get(4).x, vertices.get(4).y, vertices.get(4).z);
    shape.vertex(vertices.get(1).x, vertices.get(1).y, vertices.get(1).z);
    shape.vertex(vertices.get(3).x, vertices.get(3).y, vertices.get(3).z);
    shape.vertex(vertices.get(4).x, vertices.get(4).y, vertices.get(4).z);
    shape.vertex(vertices.get(0).x, vertices.get(0).y, vertices.get(0).z);
    shape.vertex(vertices.get(2).x, vertices.get(2).y, vertices.get(2).z);
    shape.vertex(vertices.get(5).x, vertices.get(5).y, vertices.get(5).z);
    shape.vertex(vertices.get(1).x, vertices.get(1).y, vertices.get(1).z);
    shape.vertex(vertices.get(3).x, vertices.get(3).y, vertices.get(3).z);
    shape.vertex(vertices.get(5).x, vertices.get(5).y, vertices.get(5).z);
    shape.vertex(vertices.get(0).x, vertices.get(0).y, vertices.get(0).z);

    shape.endShape();
  }

  void drawImmediate() {
    beginShape(TRIANGLE_STRIP);
    vertex(vertices.get(0).x, vertices.get(0).y, vertices.get(0).z);
    vertex(vertices.get(2).x, vertices.get(2).y, vertices.get(2).z);
    vertex(vertices.get(4).x, vertices.get(4).y, vertices.get(4).z);
    vertex(vertices.get(1).x, vertices.get(1).y, vertices.get(1).z);
    vertex(vertices.get(3).x, vertices.get(3).y, vertices.get(3).z);
    vertex(vertices.get(4).x, vertices.get(4).y, vertices.get(4).z);
    vertex(vertices.get(0).x, vertices.get(0).y, vertices.get(0).z);
    vertex(vertices.get(2).x, vertices.get(2).y, vertices.get(2).z);
    vertex(vertices.get(5).x, vertices.get(5).y, vertices.get(5).z);
    vertex(vertices.get(1).x, vertices.get(1).y, vertices.get(1).z);
    vertex(vertices.get(3).x, vertices.get(3).y, vertices.get(3).z);
    vertex(vertices.get(5).x, vertices.get(5).y, vertices.get(5).z);
    vertex(vertices.get(0).x, vertices.get(0).y, vertices.get(0).z);
    endShape();
  }
}
