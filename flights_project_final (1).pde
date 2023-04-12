class Widget {
  int x, y, w, h;
  
  Widget() {
  }
  
  Widget(int x, int y, int w, int h) {
    this.x = x;
    this.y =y;
    this.w = w;
    this.h = h;
  }
  
  Widget(int x, int y) {
    this.x = x;
    this.y =y;
  }
    
   void draw(){
      rect(x, y, w, h);
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
