class Radio extends Widget {
  boolean highlighted  = true;
  String value = "button";
  int radius = 30;
  
  Radio(int x, int y) {
    this.x = x;
    this.y =y;
  }
    
  
  void draw() {
    

    fill(#E85050);
    stroke(0);
     rect(420, 90,550, 27);
     
     String textToDisplay = "Highest amount of flights vs. lowest amount of flights";
     textSize(20);
     fill(0);
     textAlign(CENTER, CENTER);
    
    text(textToDisplay, 600 + 200/2, 100, 40/2);
    
    
    
    fill(255);
    ellipse(650, 170, radius, radius);
    text(value, x, y + 20);
    
    fill(255);
    ellipse(750, 170, radius, radius);
    text(value, x, y+20);
    
    if (highlighted) {
      fill(0);
      ellipse(650, 170, radius, radius);
      
      fill(0);
      ellipse(750, 170, radius, radius);
      
    }
  }
}
