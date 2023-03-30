import java.util.Scanner;
Table theTable;
ArrayList <DataPoint> flightsArray = new ArrayList<DataPoint>();
PFont standard;
int x = 30;
int c = 0;
int nc = 0;
void setup()  {
  theTable = loadTable("flights2k(1) (2).csv", "header");
  initFlights();
  
  standard = loadFont("Chalkboard-30.vlw");
  textFont(standard);
  size(1000,1000);
  background(#FCFCFC);
  
}


//in the draw 
void initFlights() {
  int rowCount = theTable.getRowCount();
  for (int i = 0; i < rowCount ; i++)
  {
    TableRow row = theTable.getRow(i);
    flightsArray.add(new DataPoint(row));
    String f=flightsArray.get(i).cancelled;
    int fc=Integer.parseInt(f);
    
    if(fc == 0) {
      c += 1;
      
      
      
 //   println(i + " " + flightsArray.get(i).flightDate + " " + flightsArray.get(i).mktCarrier + " " + flightsArray.get(i).flightNum + " " + flightsArray.get(i).origin  
 //+ " " + flightsArray.get(i).originCity  + " " + flightsArray.get(i).originState  + " " + flightsArray.get(i).originWAC  + " " + flightsArray.get(i).dest  + " " + flightsArray.get(i).destCity
 // + " " + flightsArray.get(i).destState  + " " + flightsArray.get(i).destWAC  + " " + flightsArray.get(i).crsDepTime  + " " + flightsArray.get(i).depTime  + " " + flightsArray.get(i).crsArrTime 
 //  + " " + flightsArray.get(i).arrTime  + " " + flightsArray.get(i).cancelled  + " " + flightsArray.get(i).diverted  + " " + flightsArray.get(i).distance, 10, x);
  }
  println("Not cancelled: ", c);
  nc = rowCount - c;
  print("cancelled: ", nc);
}
}

void draw() { 
  fill(0);
  rect(150, 600, 25, -c/4);
  rect(200, 600, 25, -nc/4);
  rect(90, 601, 3, -nc*2-50);
  rect(90, 601, 500, 3);
  textFont(standard, 16); //what font its going to be and what size - need to do an interactive map to get good marks 
  text("N/C", 150,620); //dispalyed the text, then " " is the text and its the x axis and the y axis
   text("C", 210,620);
   text(c,150,640);
   text(nc,210,640);
   
}
//  for (int i = 0; i < widgetList.size(); i++) {
//    widget awidget = (widget)widgetList.get(i);
//    aWidget.draw();
//  }
//}
//  for (int i = 0; i < flightsArray.size(); i++)
//  { fill(0);
//  text(i + " " + flightsArray.get(i).flightDate + " " + flightsArray.get(i).mktCarrier + " " + flightsArray.get(i).flightNum + " " + flightsArray.get(i).origin  
// + " " + flightsArray.get(i).originCity  + " " + flightsArray.get(i).originState  + " " + flightsArray.get(i).originWAC  + " " + flightsArray.get(i).dest  + " " + flightsArray.get(i).destCity
//  + " " + flightsArray.get(i).destState  + " " + flightsArray.get(i).destWAC  + " " + flightsArray.get(i).crsDepTime  + " " + flightsArray.get(i).depTime  + " " + flightsArray.get(i).crsArrTime 
//   + " " + flightsArray.get(i).arrTime  + " " + flightsArray.get(i).cancelled  + " " + flightsArray.get(i).diverted  + " " + flightsArray.get(i).distance, 10, x);
//   x = x + 30;
   
//  }



//import java.util.Scanner;
////final int EVENT_BUTTON1 = 1;
////final int EVENT_BUTTON2 = 2;
////final int EVENT_NULL = 0;
//Table theTable;
//ArrayList <DataPoint> flightsArray = new ArrayList<DataPoint>();
//PFont standard;
//int c = 0;
//int nc = 0;
//int x = 30;
//ArrayList widgetList;



//void setup()  {
////  Widget widget1, widget2;
//  theTable = loadTable("flights2k(1) (2).csv", "header");
//  initFlights();
  
//  standard = loadFont("Chalkboard-30.vlw");
//  textFont(standard);
//  size(1000,1000);
//  background(#FCFCFC);
// // fill(200, 200, 30, 50);
  
 //  widget1= new Widget(100, 100, 180, 40, "arrivals!", color(50, 108, 250), standard, EVENT_BUTTON1);
 // widget2= new Widget(100, 200, 180, 40,"departures!", color(5, 247, 87), standard, EVENT_BUTTON2);
 
  
 // widgetList = new ArrayList();
 // widgetList.add(widget1);
 // widgetList.add(widget2);
  


//}

//void initFlights() {
//  int rowCount = theTable.getRowCount();
//  int c = 0;
//  for (int i = 0; i < rowCount ; i++)
//  {
//    TableRow row = theTable.getRow(i);
//    flightsArray.add(new DataPoint(row));
//    String f=flightsArray.get(i).cancelled;
//    int fc=Integer.parseInt(f);
    
//    if(fc == 0) {
//     c +=1;
     
//   }
  
    
 //   println(i + " " + flightsArray.get(i).flightDate + " " + flightsArray.get(i).mktCarrier + " " + flightsArray.get(i).flightNum + " " + flightsArray.get(i).origin  
 //+ " " + flightsArray.get(i).originCity  + " " + flightsArray.get(i).originState  + " " + flightsArray.get(i).originWAC  + " " + flightsArray.get(i).dest  + " " + flightsArray.get(i).destCity
 // + " " + flightsArray.get(i).destState  + " " + flightsArray.get(i).destWAC  + " " + flightsArray.get(i).crsDepTime  + " " + flightsArray.get(i).depTime  + " " + flightsArray.get(i).crsArrTime 
 //  + " " + flightsArray.get(i).arrTime  + " " + flightsArray.get(i).cancelled  + " " + flightsArray.get(i).diverted  + " " + flightsArray.get(i).distance, 10, x);
  }
   println("Not cancelled: ",c);
   int nc = rowCount - c;
   print("Cancelled: ", nc);
}



//void draw() { 
//   fill(0);
//  rect(150, 600, 25, -c/4);
//  rect(200, 600, 25, -nc/4);
//  rect(90, 601, 3, -nc*2-50);
//  rect(90, 601, 500, 3);
//  textFont(standard, 16); //what font its going to be and what size - need to do an interactive map to get good marks 
//  text("N/C", 150,620); //dispalyed the text, then " " is the text and its the x axis and the y axis
//   text("C", 210,620);
//   text(c,150,640);
//   text(nc,210,640);
//  //for (int i = 0; i<widgetList.size(); i++) {
//  //  Widget aWidget = (Widget)widgetList.get(i);
//  //  aWidget.draw();
//  //}
//}
 // for (int i = 0; i < flightsArray.size(); i++)
 // { fill(0);
 // text(i + " " + flightsArray.get(i).flightDate + " " + flightsArray.get(i).mktCarrier + " " + flightsArray.get(i).flightNum + " " + flightsArray.get(i).origin  
 //+ " " + flightsArray.get(i).originCity  + " " + flightsArray.get(i).originState  + " " + flightsArray.get(i).originWAC  + " " + flightsArray.get(i).dest  + " " + flightsArray.get(i).destCity
 // + " " + flightsArray.get(i).destState  + " " + flightsArray.get(i).destWAC  + " " + flightsArray.get(i).crsDepTime  + " " + flightsArray.get(i).depTime  + " " + flightsArray.get(i).crsArrTime 
 //  + " " + flightsArray.get(i).arrTime  + " " + flightsArray.get(i).cancelled  + " " + flightsArray.get(i).diverted  + " " + flightsArray.get(i).distance, 10, x);
 //  x = x + 30;
  
 //}
 
  // Widget widget1, widget2;
   
   
 
 


//void mousePressed() {
//  int event;

  //for (int i = 0; i<widgetList.size(); i++) {
  //  Widget aWidget = (Widget) widgetList.get(i);
  //  event = aWidget.getEvent(mouseX, mouseY);
  //  switch(event) {
  //  case EVENT_BUTTON1:
  //    println("button 1!");
    
  //    break;
  //  case EVENT_BUTTON2:
  //    println("button 2!");
  //    background(5, 247, 87);
  //    break;
      
  //  }
  //} 
//}












//import java.util.Scanner;
//final int EVENT_BUTTON1 = 1;
//final int EVENT_BUTTON2 = 2;
//final int EVENT_NULL = 0;
//PFont standard;
//int x = 40;
//ArrayList <DataPoint> flightsArray = new ArrayList<DataPoint>();
////ArrayList widgetList;
//ArrayList dataStructure;

//void setup() {
//  size(400, 400);
//  background(255);
//  textSize(30);
//  fill(0,0,99);
//  String[] lines = loadStrings("flights2k(1) (2).csv");
//println("there are " + lines.length + " lines");
//for (int i = 0 ; i < lines.length; i++) {
//  println(lines[i]);
//  // stdFont=loadFont("Chalkboard-30.vlw");
//  //textFont(stdFont);
 
//}


//  PFont stdFont;
//  //Widget widget1, widget2;
  

  
// //widget1= new Widget(100, 100, 180, 40, "arrivals", color(50, 108, 250), stdFont, EVENT_BUTTON1);
// //widget2= new Widget(100, 200, 180, 40,"departures!", color(5, 247, 87), stdFont, EVENT_BUTTON2);
 
  
//  //widgetList = new ArrayList();
//  //widgetList.add(widget1);
// //widgetList.add(widget2);
  
//}
  
//  void draw(){
    

//for(int i = 0; i < flightsArray.size(); i++)
//{


// text ( i + " " + flightsArray.get(i).flightDate + " " + flightsArray.get(i).mktCarrier + " " + flightsArray.get(i).flightNum  + " " + flightsArray.get(i).origin  
// + " " + flightsArray.get(i).originCity  + " " + flightsArray.get(i).originState  + " " + flightsArray.get(i).originWAC  + " " + flightsArray.get(i).dest  + " " + flightsArray.get(i).destCity
//  + " " + flightsArray.get(i).destState  + " " + flightsArray.get(i).destWAC  + " " + flightsArray.get(i).crsDepTime  + " " + flightsArray.get(i).depTime  + " " + flightsArray.get(i).crsArrTime 
//   + " " + flightsArray.get(i).arrTime  + " " + flightsArray.get(i).cancelled  + " " + flightsArray.get(i).diverted  + " " + flightsArray.get(i).distance, 10, x);
//   x = x + 30;
//    fill(355, 98, 99);
//  }
  
//   //for (int j = 0; j<widgetList.size(); j++) {
//    //Widget aWidget = (Widget)widgetList.get(j);
////aWidget.draw(); 
////}
//  }
////void mousePressed() {
//  //int event;

//  //for (int i = 0; i<widgetList.size(); i++) {
//  //  Widget aWidget = (Widget) widgetList.get(i);
//  //  event = aWidget.getEvent(mouseX, mouseY);
//  //  switch(event) {
//  //  case EVENT_BUTTON1:
//  //    println("button 1!");
//  //    background(247, 5, 5);
//  //    break;
//  //  case EVENT_BUTTON2:
//  //    println("button 2!");
//  //    background(5, 247, 87);
//  //    break;
      
////    }
////  } 
////}
