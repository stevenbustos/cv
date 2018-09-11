int colorValue = 0;
int xyStart = 0;
int xEnd = 800;
int yEnd = 600;
int squareSize = 50;

void setup() {
  size(800, 600);
  background(255);
}

void draw(){
  lineas();
  cuadros();
}

// Dibuja las lineas
void lineas(){
  for (int i = xyStart; i < xEnd; i += 50) {
    stroke(153);
    line(xyStart,i,xEnd,i);
  }
}

// Dibuja los cuadros entre las filas de lineas
void cuadros(){
  for (int i = xyStart; i < xEnd; i += 100){
    for (int j = xyStart; j < xEnd; j += 200){
      fill(colorValue);
      rect(i,j,squareSize,squareSize);
    }
  }
  for (int i = 25; i < xEnd; i += 100){
    for (int j = 50; j < xEnd; j += 100){
      fill(colorValue);
      rect(i,j,squareSize,squareSize);
    }
  }
  for (int i = 50; i < xEnd; i += 100){
    for (int j = 100; j < xEnd; j += 200){
      fill(colorValue);
      rect(i,j,squareSize,squareSize);
    }
  }
}
