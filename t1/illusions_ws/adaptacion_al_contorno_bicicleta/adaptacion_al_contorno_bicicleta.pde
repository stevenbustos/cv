int interval = 40;
int time;
boolean active;
boolean interm;

void setup() {
  size(700, 600);
  background(255);
  time = millis();
}

void draw(){
   background(158);
    bicicleta();
    if(active){
      if(millis()-time > interval){
        if(interm){
          interm = !interm;
          stroke(255);
          strokeWeight(4);
          noFill();
          ellipse(200, 400, 150,150);
          ellipse(500, 400, 150,150);
        }else{
          interm = !interm;
          pushStyle();
          noStroke();
          noFill();
          ellipse(200, 400, 150,150);
          ellipse(500, 400, 150,150);
          popStyle();
        }
      }
    }
}

// Bicicleta dibujada
void bicicleta(){
  strokeWeight(3);
  stroke(125);
  line(200,400,300,180);
  noFill();
  triangle(380,400,450,250,500,400);
  triangle(380,400,450,250,500,400);
  triangle(380,400,450,250,270,250);
  line(300,180,340,180);
  line(450,250,470,220);
  line(460,220,490,220);
  stroke(0);
  strokeWeight(10);
  point(370,340);
  noStroke();
  fill(176);
  ellipse(200, 400, 150,150);
  ellipse(500, 400, 150,150);
}


// Tecla para hacer la interaccion
void keyPressed(){
  if(key == 'f'){
    active = !active;
  }
}
