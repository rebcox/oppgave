import java.sql.Timestamp;

public class Action{
  
   //private Timestamp startTime;
   //private Timestamp endTime;
   private Timestamp time;
   private Movement movement;

   /*public Action(Timestamp startTime, Timestamp endTime, Movement movement){
      this.startTime = startTime;
      this.endTime = endTime;
      this.movement = movement;
   }*/

   public Action(Timestamp time, Movement movement){
      this.time = time;
      this.movement = movement;
   }

   public Timestamp getTimestamp(){
      return time;
   }
   public Movement getMovement(){
      return movement;
   }

   public String toString(){
      return time.getTime() + " " + movement.name();
   }

}