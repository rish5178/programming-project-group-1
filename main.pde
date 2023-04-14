Table flights;
int[] stateCounts;
String[] states;
 
import javax.swing.JOptionPane;
Table theTable;
ArrayList <DataPoint> flightsArray = new ArrayList<DataPoint>();
PFont standard;
int theScreen;
PieChart pie; 

int x = 30;
int c = 0;
int nc = 0;
int zeroToFiveHundred = 0;
int fiveHundredToOneThousand = 0;
int OneThousandToOneThousandFiveHundred = 0;
int OneThousandFiveHundredToTwoThousand = 0;
int TwoThousandToTwoThousandFiveHundred = 0;
int TwoThousandFiveHundredToThreeThousand = 0;
int ThreeThousandToThreeThousandFiveHundred = 0;
int ThreeThousandFiveHundredToFourThousand = 0;
int FourThousandPlus = 0;

final int CANCEL_GRAPH = 51;
final int ORIGIN_GRAPH = 52;
final int FLIGHTS_SCREEN = 53;


final int SCREEN_WIDTH = 1000;
final int SCREEN_HEIGHT = 1000;

WelcomePage welcomePage = new WelcomePage();
boolean clicked = false;

CancelledBarChart cancel_chart;
OriginBarChart origin_chart;

Button page1;
Button page2;
Button page3;

Input page2_input;

Radio highest_button;
Radio lowest_button;

Widget[] mainWidgets = new Widget[50];
PImage[] photos = new PImage[50];

void setup() {
  theScreen = ORIGIN_GRAPH;
  flights = loadTable("flights.csv", "header");
  countStates();
   
  page2_input = new Input(700, 500);
  page1 = new Button("1", 500, 500);
  page2 = new Button("2", 550, 500);
  page3 = new Button("3", 600, 500);
  
  highest_button = new Radio(650, 170);
  lowest_button = new Radio(750, 170);
  cancel_chart = new CancelledBarChart(flights);
  origin_chart = new OriginBarChart(stateCounts, states);
  pie = new PieChart(flights);
  
  size(1000, 1000);
  PFont stdFont;
  stdFont = loadFont("ComicSansMS-20.vlw");
  textFont(stdFont);
  
  //table = loadTable("flights.csv", "header");
  //originBarChart = new OriginBarChart(table);
  //originBarChart.setup();
}

void draw() {
  if (!clicked) {
    welcomePage.draw();
  } 
  else {
    background(#E0E0E0); 
    
    page1.draw();
    page2.draw();
    page3.draw();
    highest_button.draw();
    lowest_button.draw();
   // originBarChart.draw();
    
    if (theScreen == ORIGIN_GRAPH) {
      origin_chart.draw();
    }
    else if (theScreen == CANCEL_GRAPH) {
      cancel_chart.draw();
      page2_input.draw();
    }
    else if (theScreen == FLIGHTS_SCREEN) {
      pie.draw();
    }
  }
}

void keyPressed() {
  println(key);

  if (key == '-') {
    page2_input.inputText += key;
  }
  if (key == '\n') {
    // do something when ENTER is pressed
  } else if (key == '\b' && page2_input.inputText.length() > 0) {
    page2_input.inputText = page2_input.inputText.substring(0, page2_input.inputText.length() - 1);
  } else {
    page2_input.inputText += key;
  }
  
  // if key == 'ENTER'
  //  then... edit the cancel_chart
  //  cancel_chart.changeState(USERINPUT);
}

//void keyPressed() {
//  println(key);
  
//  if (key == '-')
//  {
//    page2_input.inputText += key;
//  }
//  if (key == 'ENTER')
//  {
    
//  }
//  page2_input.inputText += key;
//}

void mousePressed(){
  if (!clicked) {
    clicked = true;
  } 
  else {
    println(mouseX, mouseY);
    
    if (page1.getEvent(mouseX, mouseY)) {
      println("Selected button 1");
      theScreen = ORIGIN_GRAPH;
    }
    else if (page2.getEvent(mouseX, mouseY)) {
      theScreen = CANCEL_GRAPH;
    }
    else if (page3.getEvent(mouseX, mouseY)) {
      theScreen = FLIGHTS_SCREEN;
    }
    else if (page3.getEvent(mouseX, mouseY)) {
      theScreen = FLIGHTS_SCREEN;
    }
    else if (highest_button.getEvent(mouseX, mouseY)) {
      
      if (highest_button.highlighted == true)
      {
        highest_button.highlighted = false;
      }
      else
      {
        highest_button.highlighted = true; 
      }
      // make some change in the ORIGIN graph, changing the values within that class
      // origin_chart...
    }


  }

}

void countStates() {
  stateCounts = new int[flights.getRowCount()];
  states = new String[flights.getRowCount()];
  
  int index = 0;
  
  for (TableRow row : flights.rows()) {
    String state = row.getString("ORIGIN");
    int i = getIndex(state);
    if (i == -1) {
      states[index] = state;
      stateCounts[index] = 1;
      index++;
    } else {
      stateCounts[i]++;
    }
  }
  
  states = subset(states, 0, index);
  stateCounts = subset(stateCounts, 0, index);
   
  // if statement with different sort
  // Sort states by frequency in descending order
  for (int i = 0; i < stateCounts.length; i++) {
    int maxIndex = i;
    for (int j = i+1; j < stateCounts.length; j++) {
      if (stateCounts[j] > stateCounts[maxIndex]) {
        maxIndex = j;
      }
    }
    int tempCount = stateCounts[i];
    stateCounts[i] = stateCounts[maxIndex];
    stateCounts[maxIndex] = tempCount;
    String tempState = states[i];
    states[i] = states[maxIndex];
    states[maxIndex] = tempState;
  }
}

int getIndex(String state) {
  for (int i = 0; i < states.length; i++) {
    if (states[i] != null && states[i].equals(state)) {
      return i;
    }
  }
  return -1;
}

void drawOriginBarChart() {
  float x = 50;
  float y = 50;
  float barWidth = 20;
  
  textSize(16);
  
  for (int i = 0; i < 25; i++) {
    float barHeight = map(stateCounts[i], 0, max(stateCounts), 0, height - 100);
    fill(50, 150, 255);
    rect(x, y + height - barHeight - 50, barWidth, barHeight);
    textAlign(CENTER);
    fill(255);
    text(states[i], x + barWidth/2, height - 20);
    x += barWidth + 10;
  }
}
void drawCancelledBarChart() {
  int numCancelled = 0;
  int numNotCancelled = 0;
  
  // Count number of cancelled and not cancelled flights
  for (TableRow row : flights.rows()) {
    int cancelled = row.getInt("CANCELLED");
    if (cancelled == 1) {
      numCancelled++;
    } else if (cancelled == 0) {
      numNotCancelled++;
    }
  }
  
  // Draw bar chart
  float x = 50;
  float y = 50;
  float barWidth = 50;
  float totalFlights = numCancelled + numNotCancelled;
  float cancelledHeight = map(numCancelled, 0, totalFlights, 0, height - 100);
  float notCancelledHeight = map(numNotCancelled, 0, totalFlights, 0, height - 100);
  
  textSize(16);
  textAlign(CENTER);
  
  fill(255, 0, 0);
  rect(x, y + height - cancelledHeight - notCancelledHeight - 50, barWidth, cancelledHeight);
  fill(0, 255, 0);
  rect(x, y + height - notCancelledHeight - 50, barWidth, notCancelledHeight);
  
  fill(255);
  text("Cancelled", x + barWidth/2, height - cancelledHeight - notCancelledHeight+40 );
  text(numCancelled, x + barWidth/2, height - cancelledHeight - notCancelledHeight+20 );
  text("Not Cancelled", x + barWidth/2, height - notCancelledHeight+40 );
  text(numNotCancelled, x + barWidth/2, height - notCancelledHeight+20 );
}

void longestRoute() {
    int rowCount = flights.getRowCount();
    for (int i = 0; i < rowCount; i++)
    {
      TableRow row = flights.getRow(i);
      flightsArray.add(new DataPoint (row));
      String f=flightsArray.get(i).distance;
      int distance=Integer.parseInt(f);
      
      if(distance <= 500) {
        
        zeroToFiveHundred += 1;
        
      }
      else if(distance > 500 && distance <=1000)
      {
        fiveHundredToOneThousand +=1;
      }
      else if(distance >1000 && distance <=1500)
      {
        OneThousandToOneThousandFiveHundred += 1;
      } 
      else if(distance >1500 && distance <=2000)
      {
        OneThousandFiveHundredToTwoThousand +=1;
      } 
      else if(distance >2000 && distance <=2500)
      {
        TwoThousandToTwoThousandFiveHundred +=1;
      } 
      else if(distance >2500 && distance <=3000)
      {
        TwoThousandFiveHundredToThreeThousand +=1;
      } 
      else if(distance >3000 && distance <=3500)
      {
        ThreeThousandToThreeThousandFiveHundred +=1;
      } 
      
      else if(distance >3500 && distance <=4000)
      {
       ThreeThousandFiveHundredToFourThousand +=1; 
      } 
      
      else if(distance >4000)
      {
        FourThousandPlus +=1;
      }   
  }
}

void initFlights(){
  int rowCount = theTable.getRowCount();
  for(int i = 0; i < rowCount; i++){
    TableRow row = theTable.getRow(i);
    flightsArray.add(new DataPoint(row));
  }
}
// pie chart
void cancelledFlights() {
  for (int i = 0; i < flightsArray.size(); i++)
  {
    int cancelledVar = int(flightsArray.get(i).cancelled);
    if ( cancelledVar == 1)
    {
      cancelledFlights++;
    } else
    {
      int predictArrTime = int(flightsArray.get(i).crsArrTime);
      int actArrTime = int(flightsArray.get(i).arrTime);
      int substraction = predictArrTime - actArrTime;
      if (substraction > 0)
      {
        earlyFlights++;
      } else if (substraction == 0)
      {
        onTimeFlights++;
      } else if (substraction < 0)
      {
        delayedFlights++;
      }
    }
  }
 println(delayedFlights);
 println(cancelledFlights);
 println(earlyFlights);
 println(onTimeFlights);
}
