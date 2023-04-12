class PieChart {
  
    /////getting two value for counts - doubling count
    
    PieChart(){
    cancelledFlights();
    }
    
    int totalFlight = 2000;
  
  void draw() {
 // need to declare to draw
    float aPos = calcRadians(onTimeFlightsCount/2);
    float bPos = calcRadians(cancelledFlightsCount/2);
    float cPos = calcRadians(earlyFlightsCount/2);
    float dPos = calcRadians(delayedFlightsCount/2);
   // println(aPos, bPos, cPos, dPos);
    
    float currPos = 0;
    
    fill(255, 0, 0);
    arc(width/2, height/2, 500, 500, currPos, aPos);
    currPos += aPos;
    
    fill(0, 255, 0);
    arc(width/2, height/2, 500, 500, currPos, currPos + bPos);
    currPos += bPos;
    
    fill(0, 0, 255);
    arc(width/2, height/2, 500, 500, currPos, currPos + cPos);
    currPos += cPos;
    
    fill(229, 250, 5);
    arc(width/2, height/2, 500, 500, currPos, currPos + dPos);
    
    textSize(40);
    fill(255);
    text("Flight Arrival Time", 250, 100);
    textSize(25);
    text("% On time = ", 100, 400); //red
    text("% Early = ", 300, 400); //blue
    text("% Cancelled = ", 100, 500); //green
    text("% Delayed = ", 305, 500); //yellow
    fill(255, 0, 0);
    rect(250, 375, 20, 20);
    fill(0, 0, 255);
    rect(410, 375, 20, 20);
    fill(229, 250, 5);
    rect(275, 475, 20, 20);
    fill(0, 255, 0);
    rect(450, 475, 20, 20);
}
  
  float calcRadians(float f) {
    float percentage = (f / totalFlight) * 100;
    float arcPercent = (percentage / 100) * 360;
    float arcRadians = radians(arcPercent);
    return arcRadians;
  }

}
