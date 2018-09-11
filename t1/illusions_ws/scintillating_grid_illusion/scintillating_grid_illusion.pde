int colorValue = 0;
int xyStart = 0;
int xEnd = 800;
int yEnd = 600;

void setup() {
  size(800, 600);
  background(0);
}

void draw(){
  cuadricula();
  puntos();
}

// Dibuja la cuadricula
void cuadricula(){
  for (int i = xyStart; i < xEnd; i += 50) {
    stroke(153);
    strokeWeight(6);
    line(xyStart,i,xEnd,i);
    line(i,xyStart,i,xEnd);
  }
}

// Dibuja los puntos en la cuadricula
void puntos(){
  for (int i = xyStart; i < xEnd; i += 50){
    for (int j = xyStart; j < xEnd; j += 50){
      fill(255);
      stroke(255);
      ellipse(i,j,5,5);
    }
  }
}
