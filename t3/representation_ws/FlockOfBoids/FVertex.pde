class FVertex extends ShapeRep {
  float sc;
  FVertex (float s){
    sc = s;
    buildShape();
  }

  void buildShape() {
    vertices = new ArrayList<PVector>();
    ArrayList<Face> faces;
    faces = new ArrayList<Face>();

    PVector X1 = new PVector(3*sc, 0, 0);
    PVector X2 = new PVector(-3*sc, 0, 0);
    PVector Y1 = new PVector(0, 3*sc, 0);
    PVector Y2 = new PVector(0, -3*sc, 0);
    PVector Z1 = new PVector(0, 0, 3*sc);
    PVector Z2 = new PVector(0, 0, -3*sc);

    Face f1 = new Face(X2,Y1,Z2);
    Face f2 = new Face(X1,Y1,Z2);
    Face f3 = new Face(X2,Z2,Y2);
    Face f4 = new Face(Z2,X1,Y2);
    Face f5 = new Face(X2,Z1,Y1);
    Face f6 = new Face(X1,Z1,Y1);
    Face f7 = new Face(X2,Z1,Y2);
    Face f8 = new Face(X1,Z1,Y2);

    vertices.add(X1);
    vertices.add(X2);
    vertices.add(Y1);
    vertices.add(Y2);
    vertices.add(Z1);
    vertices.add(Z2);

    faces.add(f1);
    faces.add(f2);
    faces.add(f3);
    faces.add(f4);
    faces.add(f5);
    faces.add(f6);
    faces.add(f7);
    faces.add(f8);

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

    shape = createShape();
    shape.beginShape(TRIANGLES);
    for(Face f:faces){
      for(PVector v : f.vertex_list){
        shape.vertex(v.x,v.y,v.z);
      }
    }
    shape.endShape();
  }

  void drawImmediate() {
   vertices = new ArrayList<PVector>();
    ArrayList<Face> faces;
    faces = new ArrayList<Face>();

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

    Face f1 = new Face(X1,Y1,Z1);
    Face f2 = new Face(X1,Y1,Z2);
    Face f3 = new Face(X1,Y2,Z2);
    Face f4 = new Face(X1,Y2,Z1);
    Face f5 = new Face(X2,Y1,Z1);
    Face f6 = new Face(X2,Y1,Z2);
    Face f7 = new Face(X2,Y2,Z2);
    Face f8 = new Face(X2,Y2,Z1);

    faces.add(f1);
    faces.add(f2);
    faces.add(f3);
    faces.add(f4);
    faces.add(f5);
    faces.add(f6);
    faces.add(f7);
    faces.add(f8);

    /*vertex(vertices.get(0).x, vertices.get(0).y, vertices.get(0).z);
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
    vertex(vertices.get(0).x, vertices.get(0).y, vertices.get(0).z); */

    beginShape(TRIANGLE_STRIP);
    for(Face f:faces){
      for(PVector v : f.vertex_list){
        vertex(v.x,v.y,v.z);
      }
    }
    endShape();
  }
}
