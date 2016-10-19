import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

class movementListener implements KeyListener{
   public void keyTyped(KeyEvent e) {
   }

   public void keyPressed(KeyEvent e) {
      if(e.getKeyCode() == KeyEvent.VK_UP){
         System.out.println("Key up pressed");
      }
      else if(e.getKeyCode() == KeyEvent.VK_DOWN){

      }
      else if(e.getKeyCode() == KeyEvent.VK_LEFT){

      }
      else if(e.getKeyCode() == KeyEvent.VK_RIGHT){

      }
   }

   public void keyReleased(KeyEvent e) {
      if(e.getKeyCode() == KeyEvent.VK_UP){
         System.out.println("Key up released");
      }
      else if(e.getKeyCode() == KeyEvent.VK_DOWN){

      }
      else if(e.getKeyCode() == KeyEvent.VK_LEFT){

      }
      else if(e.getKeyCode() == KeyEvent.VK_RIGHT){

      }
   }

}