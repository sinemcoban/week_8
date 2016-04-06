import controlP5.*;

ControlP5 cp5;

// Import pdf library to use pdf methods
import processing.pdf.*;

int save;

int centerX;
int centerY;


// Rectangle variables
int rect_radius;
int rect_num;
int rect_w;
int rect_h;
int rect_thickness;
boolean drawRectangles;

int ellipse_radius;
int ellipse_num;
int ellipse_w;
int ellipse_h;
int ellipse_thickness;
boolean drawEllipses;

int line_radius;
int line_num;
int line_w;
int line_h;
int line_thickness;
boolean drawLines;



void setup() {
  size(1024, 768);
  background(0);

  // set save var default value to false
  save = 0;

  // Default Rectangle variables
  rect_radius = 180;
  rect_num = 12;
  rect_w = 30;
  rect_h = 30;
  rect_thickness = 1;
  drawRectangles = true;
  
  ellipse_radius = 180;
  ellipse_num = 12;
  ellipse_w = 30;
  ellipse_h = 30;
  ellipse_thickness = 1;
  drawEllipses = true;
  
   line_radius = 180;
  line_num = 12;
  line_w = 30;
  line_h = 30;
  line_thickness = 1;
  drawLines = true;

 

  // Window Center position
  centerX = int(width) / 2;
  centerY = int(height) / 2;

  // GUI
  cp5 = new ControlP5(this);

  


  // RECTANGLES
  cp5.addToggle("drawRectangles")
    .setPosition(20, 10)
      .setSize(10, 10)
        .setValue(drawRectangles)
          ;

  cp5.addSlider("rect_radius")
    .setPosition(20, 40)
      .setSize(100, 10)
        .setRange(0, 255)
          .setValue(rect_radius)
            ;

  cp5.addSlider("rect_num")
    .setPosition(20,60)
      .setSize(100, 10)
        .setRange(0, 255)
          .setValue(rect_num)
            ;

  cp5.addSlider("rect_w")
    .setPosition(20,80)
      .setSize(100, 10)
        .setRange(0, 255)
          .setValue(rect_w)
            ;

  cp5.addSlider("rect_h")
    .setPosition(20,100)
      .setSize(100, 10)
        .setRange(0, 255)
          .setValue(rect_h)
            ;

  cp5.addSlider("rect_thickness")
    .setPosition(20,120)
      .setSize(100, 10)
        .setRange(0, 255)
          .setValue(rect_thickness)
            ;
//ELLIPSES
cp5.addToggle("drawEllipses")
    .setPosition(20, 150)
      .setSize(10, 10)
        .setValue(drawEllipses)
          ;

  cp5.addSlider("ellipse_radius")
    .setPosition(20, 180)
      .setSize(100, 10)
        .setRange(0, 255)
          .setValue(ellipse_radius)
            ;

  cp5.addSlider("ellipse_num")
    .setPosition(20,200)
      .setSize(100, 10)
        .setRange(0, 255)
          .setValue(ellipse_num)
            ;

  cp5.addSlider("ellipse_w")
    .setPosition(20,220)
      .setSize(100, 10)
        .setRange(0, 255)
          .setValue(ellipse_w)
            ;

  cp5.addSlider("ellipse_h")
    .setPosition(20,250)
      .setSize(100, 10)
        .setRange(0, 255)
          .setValue(ellipse_h)
            ;

  cp5.addSlider("ellipse_thickness")
    .setPosition(20,270)
      .setSize(100, 10)
        .setRange(0, 255)
          .setValue(ellipse_thickness)
            ;
            
    // LINES
    cp5.addToggle("drawLines")
    .setPosition(20, 300)
      .setSize(10, 10)
        .setValue(drawRectangles)
          ;

  cp5.addSlider("line_radius")
    .setPosition(20, 330)
      .setSize(100, 10)
        .setRange(0, 255)
          .setValue(rect_radius)
            ;

  cp5.addSlider("line_num")
    .setPosition(20,350)
      .setSize(100, 10)
        .setRange(0, 255)
          .setValue(rect_num)
            ;


            
  cp5.addSlider("line_thickness")
    .setPosition(20,370)
      .setSize(100, 10)
        .setRange(0, 255)
          .setValue(rect_thickness)
            ;

  
    


}

public void SaveFile(int theValue) {
  save = theValue;
  
  println(save);
}

void draw() {

  // ---------------------------------------------------------------
  // Begin Recording...
  // ---------------------------------------------------------------
  if (save == 1) 
  {
    int d = day();    // Values from 1 - 31
    int m = month();  // Values from 1 - 12
    int y = year();   // 2003, 2004, 2005, etc.
    int h = hour();
    int mi = minute();
    int s = second();

    // Convert to string
    String cday = String.valueOf(d);
    String cmonth = String.valueOf(m);
    String cyear = String.valueOf(y);
    String chour = String.valueOf(h);
    String cminute = String.valueOf(mi);
    String csecond = String.valueOf(s);

    beginRecord(PDF, "name-surname-"+ cyear + "-" + cmonth + "-" + cday + "-" + chour + "." + cminute + "." + csecond +".ai");
  }
  // ---------------------------------------------------------------

  background(0);

  // RECTANGLES
  float x, y;

  // to make equal space around 360 degree of circle
  float anglePerRect = 360.0f / rect_num;  

  strokeWeight(rect_thickness);
  for (int num=0; num < rect_num; num+= 1) {

    float rad = num * anglePerRect * (PI / 180);

    x = centerX + (rect_radius * cos(rad));
    y = centerY + (rect_radius * sin(rad));

    noFill();
    pushMatrix();

    translate(x, y);
    rectMode(CENTER);
    rotate(rad);
    //radians(num * anglePerRect)
    stroke(255);

    if (drawRectangles == true) {
      rect(0, 0, rect_w, rect_h);
    }

    //rectMode(CORNER);
    popMatrix();
  }
  
  // RECTANGLE END
  
  

  // to make equal space around 360 degree of circle
  float anglePerEllipse = 360.0f / ellipse_num;  

  strokeWeight(ellipse_thickness);
  for (int num=0; num < ellipse_num; num+= 1) {

    float rad = num * anglePerEllipse * (PI / 180);

    x = centerX + (ellipse_radius * cos(rad));
    y = centerY + (ellipse_radius * sin(rad));

    noFill();
    pushMatrix();

    translate(x, y);
    rectMode(CENTER);
    rotate(rad);
    //radians(num * anglePerEllipse)
    stroke(255);

    if (drawEllipses == true) {
      ellipse(0, 0, ellipse_w, ellipse_h);
    }

    //rectMode(CORNER);
    popMatrix();
  }
  // ELLIPSE END
  
  float anglePerLine = 360.0f / line_num;  

  strokeWeight(line_thickness);
  for (int num=0; num < line_num; num+= 1) {

    float rad = num * anglePerLine * (PI / 180);

    x = centerX + (line_radius * cos(rad));
    y = centerY + (line_radius * sin(rad));

    noFill();
    pushMatrix();

    translate(x, y);
    rectMode(CENTER);
    rotate(rad);
    //radians(num * anglePerEllipse)
    stroke(255);

    if (drawLines == true) {
      line(0, 0, ellipse_w, ellipse_h);
    }

    //rectMode(CORNER);
    popMatrix();
  }


 
  // ---------------------------------------------------------------
  // Stop Recording...
  // ---------------------------------------------------------------
  if (save == 1) 
  {
    endRecord();
    save = 0;  // Set it to false to record just single frame
  }
  // ---------------------------------------------------------------

}

void keyPressed() {

  if (key >= 'r') {
    save = 1;
  }


}
