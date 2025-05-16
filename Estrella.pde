 class Estrella{
   
    float x, y, size, count;
    Linea[] lines;
    color colorin;
    color[] lineColors;
    
   Estrella(float x, float y, float size, int count, int countMin, int countMax, color colorin) {
     this.x = x;
     this.y = y;
     this.size = size;
     this.count = count;
     this.colorin = colorin;

     lines = new Linea[count];
     lineColors = new color[count];
     for (int i = 0; i < count; i++) {
       lineColors[i] = color(red(colorin ) + random(-20, 20), green(colorin) + random(-20, 20), blue(colorin) + random(-20, 20), 150);
       lines[i] = new Linea(random(1, map(count, countMin, countMax, 20, 200)));
     }
   }

   void update() {
    for (int i = 0; i < count; i++) {
      lines[i].update();
    }
   }
   
   void display() {
    pushMatrix();
    translate(x, y);
    for (int i = 0; i < count; i++) {
      stroke(lineColors[i]);
      strokeWeight(random(1, 3));
      fill(255, 200);
      lines[i].display();
    }
    popMatrix();
   }

 }
