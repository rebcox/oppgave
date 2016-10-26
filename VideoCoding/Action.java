import java.sql.Timestamp;
import javafx.util.Duration;

public class Action{
  
   //private Timestamp startTime;
   //private Timestamp endTime;
   private Timestamp time;
   private Movement movement;
   private Timestamp startTime;
   private Duration duration;

   /*public Action(Timestamp startTime, Timestamp endTime, Movement movement){
      this.startTime = startTime;
      this.endTime = endTime;
      this.movement = movement;
   }*/

   public Action(Timestamp time, Movement movement){
      this.time = time;
      this.movement = movement;

      this.startTime = time;
      this.duration = new Duration(1);
   }

   public Action(Timestamp startTime, Movement movement, Duration duration)
   {
      this.startTime = startTime;
      this.movement = movement;
      this.duration = duration;  

      this.time = startTime;    
   }

   public Timestamp getTimestamp(){
      return time;
   }

   public Timestamp getStartTime(){
      return startTime;
   }
   public Duration getDuration(){
      return duration;
   }

   public Movement getMovement(){
      return movement;
   }

   public String toString(){
      return time.getTime() + " " + movement.name();
   }

}