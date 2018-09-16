int init = 0;
int y = 0;
boolean active;

void setup() {
  size(800, 600);
  background(255);
}

void draw(){
  frameRate(10);
    background(145);
    if(active){
      figuras();
      movimiento();
    }else{
      figuras();
    }
}

// Dibujado de las figuras
void figuras(){
  noStroke();
  fill(255,128,020);
  rect(0,0,400,400);
  stroke(0);
  strokeWeight(15);
  line(400,0,400,400);
  line(0,400,400,400); 
  stroke(0);
  strokeWeight(30);
  point(600,450);
}

// Movimiento de la barra
void movimiento(){
  noStroke();
  fill(145);
  rect(0,y,393,80);
  if ( y > 250){
    y = 50;
  }else{
    y += 40;
  }
}

// Accion con la tecla F
void keyPressed(){
  if(key == 'f'){
    active = !active;
  }
}
