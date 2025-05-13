import java.util.Map;

Table datos;
String[] artistas;
int[] conteos;

int[][] posList;
float[] tamanos;

int conteoMax;

Estrella[] stars;
color[] colores;

void setup(){
  size( 1080, 1080 );
  datos = loadTable("database/top30.csv", "header");
  artistas = new String[datos.getRowCount()];
  conteos = new int[datos.getRowCount()];
  tamanos = new float[datos.getRowCount()];
  
  posList = new int[datos.getRowCount()][2];
  
  stars = new Estrella[datos.getRowCount()];

  colores = new color[datos.getRowCount()];
  
  // Leer datos de la base de datos
  
  for (int i = 0; i < datos.getRowCount(); i += 1){
    TableRow fila = datos.getRow(i);
    artistas[i] = fila.getString("Artist");
    conteos[i] = fila.getInt("TrackCount");
    
    posList[i][0] = round(random(100, width - 100));
    posList[i][1] = round(random(100, height - 100));
    
    tamanos[i] = map(conteos[i], 64, 392, 10, 150 );
    colores[i] = color(random(100, 255), random(0, 100), random(0, 100));
  }

  for (int i = 0; i < datos.getRowCount(); i += 1){
    stars[i] = new Estrella(posList[i][0], posList[i][1], tamanos[i], conteos[i], 64, 392, colores[i]);
  }
  
}

void draw(){
  background(0);
  for (int i = 0; i < datos.getRowCount(); i += 1){
    // pushMatrix();
    // translate(posList[i][0], posList[i][1]);
    stars[i].update();
    stars[i].display();
    // popMatrix();
  }
  mouseHover(mouseX, mouseY);
}

void mouseHover(int x, int y){
  for (int i = 0; i < datos.getRowCount(); i += 1){
    if (dist(x, y, posList[i][0], posList[i][1]) < 30){
      // println(artistas[i]);
      textSize(30);
      text(artistas[i], posList[i][0], posList[i][1]);
    }
  }
}
