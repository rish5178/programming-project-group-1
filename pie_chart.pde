class PieChart {
   int delayedFlights;
   int cancelledFlights;
   int earlyFlights;
   int onTimeFlights;
  
    /////getting two value for counts - doubling count
   ArrayList <DataPoint> flightsArray = new ArrayList<DataPoint>();
   
    PieChart(Table flights) {
     delayedFlights = 0;
     cancelledFlights = 0;
     earlyFlights =0;
     onTimeFlights = 0;
   
      this.initFlights(flights);
      this.cancelledFlights();
    }
    
   int totalFlight = 2000;
   
   void initFlights(Table theTable){
    int rowCount = theTable.getRowCount();
    for(int i = 0; i < rowCount; i++){
      TableRow row = theTable.getRow(i);
      flightsArray.add(new DataPoint(row));
    }
  }

  void cancelledFlights() {
    for (int i = 0; i < flightsArray.size(); i++)
    {
      int cancelledVar = int(flightsArray.get(i).cancelled);
      if ( cancelledVar == 1)
      {
        this.cancelledFlights++;
      } else
      {
        int predictArrTime = int(flightsArray.get(i).crsArrTime);
        int actArrTime = int(flightsArray.get(i).arrTime);
        int substraction = predictArrTime - actArrTime;
        if (substraction > 0)
        {
          this.earlyFlights++;
        } else if (substraction == 0)
        {
          this.onTimeFlights++;
        } else if (substraction < 0)
        {
          this.delayedFlights++;
        }
      }
    }

  }
  
  void draw() {
 // need to declare to draw
    //float aPos = calcRadians(this.onTimeFlights/2);
    //float bPos = calcRadians(this.cancelledFlights/2);
    float aPos = calcRadians(this.onTimeFlights);
    float bPos = calcRadians(this.cancelledFlights);
    float cPos = calcRadians(this.earlyFlights);
float dPos = calcRadians(this.delayedFlights);

    //float cPos = calcRadians(this.earlyFlights/2);
    //float dPos = calcRadians(this.delayedFlights/2);
    //pie.draw();
    println(aPos, bPos, cPos, dPos);
    
    println(delayedFlights);
    println(cancelledFlights);
    println(earlyFlights);
     println(onTimeFlights);
   
    float currPos = 0;
    
    fill(255, 0, 0);
    arc(width/2, height/2, 500, 500, currPos, currPos + aPos);
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
    text("Flight Arrival Time !", 600, 100);
    textSize(25);
    text("% On time = ", 150, 60); //red
    text("% Early = ", 150, 110); //blue
    text("% Cancelled = ", 150, 160); //green
    text("% Delayed = ", 150, 210); //yellow
    fill(255, 0, 0);
    rect(250, 50, 20, 20);
    fill(0, 0, 255);
    rect(250, 100, 20, 20);
    fill(229, 250, 5);
    rect(250, 150, 20, 20);
    fill(0, 255, 0);
    rect(250, 200, 20, 20);
}
  
  float calcRadians(float f) {
    float percentage = (f / totalFlight) * 100;
    float arcPercent = (percentage / 100) * 360;
    float arcRadians = radians(arcPercent);
    return arcRadians;
  }

}
