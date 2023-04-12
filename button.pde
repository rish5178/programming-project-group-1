class Button extends Widget {
    String value;
    int w = 40;
    int h = 40;
     
   Button(String value, int x, int y) {
     this.value = value;
     this.x = x;
     this.y = y;
   }

   void draw(){
      fill(175);
      rect(x, y, w, h);
      fill(255);
      text(value, x+10, y+15);
      
   }
   
   boolean getEvent(int x, int y) {
        // check if mouse is within window
     println("Boundaries of button are between: " + (this.x) + " and " + (this.x+this.w));
     if (x>this.x && x < this.x+this.w && y >this.y && y <this.y+this.h)
     {    
          return true;
     }
      println("Didn't click the button");
      return false;
   }
   
}
  
