int start = 0;
int end = 800;
float x = 0;
float y = 0;
int a = 80;
int b = 60;

void setup() {
  size(800, 600);
  background(255);
}

void draw(){
  background(255);  
  franjas();  
  carros();
  move();
}

// Franjas
void franjas(){
  rectMode(CORNER);
  noStroke();
  fill(0);
  for (int i=0; i<300; i+=40) {
    rect(0, i, 800, 20);
  }
}

// Los carros que se mueven
void carros(){
  fill(255, 255, 0);
  rect(500, b, a, a);
  fill(0, 0, 255);
  rect(200, b, a, a);
}

// El movimiento de los cuadros
void move(){
  if (b >= height-a/2) {
    start = 1;
  }
  if (b == a/2) {
    start = 0;
  }
  if (start == 0) {
    b++;
  }
  else {
    b--;
  }
}
