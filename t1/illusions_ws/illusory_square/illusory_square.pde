int init = 0;
int a = 100;
int b = 400;
boolean active;

void setup() {
  size(500, 500);
  background(255);
}

void draw(){
  frameRate(40);
    background(0);
    if(active){
      figuras();
      move();
    }else{
      figuras();
    }  
}

// Dibujado de las figuras
void figuras(){
  rectMode(CENTER);
  stroke(255);
  strokeWeight(2);
  noFill();
  rect(250, 250, 150, 150);
  noStroke();
  fill(100);
  ellipse(a, 250, 100, 100);
  ellipse(250, a, 100, 100);
  ellipse(b, 250, 100, 100);
  ellipse(250, b, 100, 100);
  fill(210);
  ellipse(a+190, 250, 20, 20);
  ellipse(250, a+190, 20, 20);
  ellipse(b-190, 250, 20, 20);
  ellipse(250, b-190, 20, 20);
}

// Movimiento
void move(){
  if (a>=165) {
    init=1;
  }
  if (a==100) {
    init=0;
  }
  if (init==0) {
    a++;
    b--;
  }
  else {
    a--;
    b++;
  }
}

// Interaccion con la tecla F
void keyPressed(){
  if(key == 'f'){
    active = !active;
  }
}
