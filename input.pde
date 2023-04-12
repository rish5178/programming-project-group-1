// String userInput = JOptionPane.showInputDialog("Enter a state code: ");
// String input;

import javax.swing.JOptionPane;

class Input extends Widget {
  
  String inputText = "sample";
  
  Input(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void draw() {
    fill(255);
    text(inputText, x, y);
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
