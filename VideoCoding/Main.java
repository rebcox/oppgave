import javafx.application.Application;
import javafx.scene.media.Media;
import javafx.scene.media.MediaPlayer;
import javafx.scene.media.MediaView;
import javafx.scene.layout.BorderPane;
import javafx.scene.Scene;
import java.awt.Color;
import javafx.stage.Stage;
import java.io.File;
import java.awt.Button;

public class Main extends Application {

   Scene scene;

   @Override
   public void start(Stage primaryStage)
   {
      Media media = new Media(new File("/Users/rebeccacox/Dropbox/Prosjektoppgave/Catwoman/FrameNumberCounter/CatWoman.mp4").toURI().toString());
     
      MediaPlayer mediaPlayer = new MediaPlayer(media);
      mediaPlayer.setAutoPlay(true);
      MediaView mediaView = new MediaView(mediaPlayer);

      BorderPane borderPane = new BorderPane();
      borderPane.setCenter(mediaView);
      //borderPane.setBottom(addToolBar());

      borderPane.setStyle("-fx-background-color: Black");

      scene = new Scene(borderPane, 915, 500);

     //scene.setFill(Color.BLACK);

      primaryStage.setTitle("Video");
      primaryStage.setScene(scene);
      primaryStage.show();
   }

   class movementListener implements KeyListener{
      public Action action;
      public void keyTyped(KeyEvent e) {
      }

      public void keyPressed(KeyEvent e) {
         if(e.getKeyCode() == KeyEvent.VK_UP){
            action = new Action(new Timestamp(System.currentTimeMillis()), Movement.LOOKUP);
            System.out.println("Key up pressed");
         }
         else if(e.getKeyCode() == KeyEvent.VK_DOWN){
            action = new Action(new Timestamp(System.currentTimeMillis()), Movement.LOOKDOWN);
            System.out.println("Key down pressed");
         }
         else if(e.getKeyCode() == KeyEvent.VK_LEFT){
            action = new Action(new Timestamp(System.currentTimeMillis()), Movement.LOOKLEFT);
            System.out.println("Key left pressed");
         }
         else if(e.getKeyCode() == KeyEvent.VK_RIGHT){
            action = new Action(new Timestamp(System.currentTimeMillis()), Movement.LOOKRIGHT);
            System.out.println("Key right pressed");
         }
         else if(e.getKeyCode() == KeyEvent.VK_SPACE){
            action = new Action(new Timestamp(System.currentTimeMillis()), Movement.YAWN);
            System.out.println("Space pressed");
         }
         actions.add(action);
      }

      public void keyReleased(KeyEvent e) {
         /*
         if(e.getKeyCode() == KeyEvent.VK_UP){
            System.out.println("Key up released");
         }
         else if(e.getKeyCode() == KeyEvent.VK_DOWN){

         }
         else if(e.getKeyCode() == KeyEvent.VK_LEFT){

         }
         else if(e.getKeyCode() == KeyEvent.VK_RIGHT){

         }
         */
      }
   }
   public static void main(String[] args) {
      
      launch(args);
   }
}