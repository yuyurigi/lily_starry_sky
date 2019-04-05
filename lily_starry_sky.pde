import java.util.Calendar;

int num = 0;
int maxnum = 1000;
int dimborder = 20; //縁の太さ
int time = 0;

Star[] stars;

color[] colorArray = {color(0, 107, 128),    //星の色　濃い青
 color(110, 180, 190),  //青
 color(226, 231, 227),  //灰色
 color(255, 255, 209),  //黄色
 color(255, 204, 188) };//ピンク
 /*
color[] colorArray = { //星の色
  color(43, 133, 140), 
  color(115, 206, 185), 
  color(200, 255, 217), 
  color(255, 255, 209), 
  color(255, 204, 188) }; 
*/
color[] colorAddArray;

PShape moonSvg; //月のsvg画像
PShape starSvg; //星のsvg画像

// background image
PImage backImage;

color backColor = color(0, 64, 84); //背景色
color borderColor = color(226, 231, 227); //縁の色
// MAIN -----------------------------------------------------------

void setup() {
  size(800, 800);
  frameRate(30);

  // create stars
  stars = new Star[maxnum];

  moonSvg = loadShape("moon.svg");
  starSvg = loadShape("star.svg");
  moonSvg.disableStyle();
  starSvg.disableStyle();
  shapeMode(CENTER);
  backImage = loadImage("lily.png");
  colorAddArray = append(colorArray, backColor); //星と背景の色が入った配列

  resetAll();
}

void draw() {
  for (int n=0; n<num; n++) {
    stars[n].draw();
  }

  if (time == 700) {
    makeNewStar();
    makeNewStar();
    makeNewStar();
    makeNewStar();
  }

  time++;
}

void mousePressed() {
  resetAll();
}

void resetAll() {      
  // stop drawing
  num=0;
  time = 0;

  background(backColor);
  image(backImage, 0, 0); //リリィ
  drawWhiteBorder();

  makeNewStar();
}


void makeNewStar() {

  if (time < 700) { 
    if (num<1) {
      stars[num] = new Star();
      num++;
    }
  } else {
    if (num<2) {
      stars[num] = new Star();
      num++;
    }
  }
}

void drawWhiteBorder() {
  fill(borderColor);
  noStroke();
  rect(0, 0, width, dimborder); //縁
  rect(0, 0, dimborder, height); //縁
  rect(0, height-dimborder, width, dimborder); //縁
  rect(width-dimborder, 0, dimborder, height); //縁
}

void keyReleased() {
  if (key == 's' || key == 'S')saveFrame(timestamp()+"_####.png");
}


String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
