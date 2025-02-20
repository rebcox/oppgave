import java.io.File;
import java.lang.Math;
import java.lang.String;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javafx.application.Application;
import javafx.beans.property.DoubleProperty;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.Button;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.media.*;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.util.Duration;

public class FrameCounter extends Application{
  
   private String filenameVideo = "/home/rebecca/Desktop/FindingMotions/CatWoman009.mp4";
   private String filenameForMatlab = "/home/rebecca/Desktop/FindingMotions/motionDataPart9.txt"; 
   private double frequency = 7.8125;
   private int startSecond = 1300;
   private long startFrame = 10401;

   private List<Action> actions;
   private List<Action> tempActions;
   private Scene scene;
   private Timestamp startTimeStamp;
   private Media media;
   private Duration startTime;
   private MediaPlayer mediaPlayer;
   private MediaView mediaView;
   static Timestamp pauseStart;
   private List<Pause> pauseList;


   @Override
   public void init()
   {
      actions = new ArrayList<Action>();
      tempActions = new ArrayList<Action>();
      pauseStart = new Timestamp(0);
      pauseList = new ArrayList<Pause>();
   }

   @Override
   public void start(Stage primaryStage)
   {
      startTimeStamp = new Timestamp(System.currentTimeMillis());
      try{
         media = new Media(new File(filenameVideo).toURI().toString());
         mediaPlayer = new MediaPlayer(media);
         startTime = Duration.seconds(startSecond);
         mediaPlayer.setStartTime(startTime);
         mediaView = new MediaView(mediaPlayer);
      }
      catch(MediaException e){
         System.err.println(e);
         return;
      }

      //mediaPlayer.setAutoPlay(true);

      //DoubleProperty fitHeightProperty = mediaView.fitHeightProperty();
      mediaView.setFitHeight(550);
      BorderPane borderPane = new BorderPane();
      borderPane.setCenter(mediaView);
      borderPane.setBottom(addToolBar());

      borderPane.setStyle("-fx-background-color: Black");

      scene = new Scene(borderPane, 1000, 600);
      scene.setOnKeyPressed(new EventHandler<KeyEvent>() {
            Action action;
            @Override
            public void handle(KeyEvent event) {
               switch (event.getCode()) {
                  case UP:    
                     action = new Action(new Timestamp(System.currentTimeMillis()), Movement.LOOKUP);
                     System.out.println("Key up pressed"); 
                     break;
                  case DOWN:                      
                     action = new Action(new Timestamp(System.currentTimeMillis()), Movement.LOOKDOWN);
                     System.out.println("Key down pressed"); 
                     break;
                  case LEFT:  
                     action = new Action(new Timestamp(System.currentTimeMillis()), Movement.LOOKLEFT);
                     System.out.println("Key left pressed"); 
                     break;
                  case RIGHT:
                     action = new Action(new Timestamp(System.currentTimeMillis()), Movement.LOOKRIGHT);
                     System.out.println("Key right pressed"); 
                     break;
                  case SPACE:
                     action = new Action(new Timestamp(System.currentTimeMillis()), Movement.SMALL);
                     System.out.println("Space pressed"); 
                     break;
                  case F:
                     action = new Action(new Timestamp(System.currentTimeMillis()), Movement.FACE);
                     System.out.println("f pressed"); 
                     break;
                }
               tempActions.add(action);
            }
        });
      scene.setOnKeyReleased(new EventHandler<KeyEvent>() {
         @Override
         public void handle(KeyEvent event) {
            switch(event.getCode()){
               case UP: case DOWN: case LEFT: case RIGHT: case SPACE: case F:
                  Timestamp startTime = tempActions.get(0).getTimestamp();
                  Duration duration = new Duration(System.currentTimeMillis()-startTime.getTime());
                  actions.add(new Action(startTime, tempActions.get(0).getMovement(), duration));
                  tempActions.clear();
                  break;
            }
         }
      });

      primaryStage.setTitle("Catwoman");
      //primaryStage.setFullScreen(true);
      primaryStage.setScene(scene);
      primaryStage.show();
   }

   @Override
   public void stop(){
      ActionsForMatlab actionsForMatlab = new ActionsForMatlab(actions, startTimeStamp, frequency, startFrame, pauseList);
      actionsForMatlab.writeToFile(filenameForMatlab);
   }

   private HBox addToolBar() {
      HBox toolBar = new HBox();
      toolBar.setPadding(new Insets(20));
      toolBar.setAlignment(Pos.CENTER);
      toolBar.alignmentProperty().isBound();
      toolBar.setSpacing(5);
      toolBar.setStyle("-fx-background-color: Black");

      Button playButton = new Button("Play");
      playButton.setFocusTraversable(false);
      playButton.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
               System.out.println("Play pressed");
               mediaPlayer.play();
               if (pauseStart.getTime() != 0){
                  pauseList.add(new Pause(new Timestamp(pauseStart.getTime()), new Timestamp(System.currentTimeMillis())));
                  pauseStart.setTime(0);
               }
            }
        });
      Button pauseButton = new Button("Pause");
      pauseButton.setFocusTraversable(false);

      pauseButton.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
               System.out.println("Pause pressed");
               mediaPlayer.pause();
               if (pauseStart.getTime() == 0){
                  pauseStart.setTime(System.currentTimeMillis());                  
               }
            }
        });
      
      toolBar.getChildren().addAll(playButton, pauseButton);
      return toolBar;
   }


   public static void main(String[] args) {
      launch(args); 
   }
   
}
