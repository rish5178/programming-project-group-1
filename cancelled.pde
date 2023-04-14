
class CancelledBarChart {
  
  float x = 50;
  float y = 50;
  float barWidth = 50;
  float totalFlights;
  float cancelledHeight;
  float notCancelledHeight;
  int numCancelled = 0;
  int numNotCancelled = 0;
  
  CancelledBarChart(Table flights) {
    
    // row.getString("NY") == "NY", then add to cancelled
    for (TableRow row : flights.rows()) {
      int cancelled = row.getInt("CANCELLED");
      if (cancelled == 1) {
        numCancelled++;
      } else if (cancelled == 0) {
        numNotCancelled++;
      }
    }
    
    totalFlights = numCancelled + numNotCancelled;
    cancelledHeight = map(numCancelled, 0, totalFlights, 0, height - 100);
    notCancelledHeight = map(numNotCancelled, 0, totalFlights, 0, height - 100);
  }
  
  
  
  void draw() {
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
}
