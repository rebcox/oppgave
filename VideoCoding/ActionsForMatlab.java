import java.sql.Timestamp;
import java.util.List;
import java.lang.Math;
import java.lang.String;
import java.io.PrintWriter;
import java.io.FileNotFoundException;

public class ActionsForMatlab{

   private List<Action> actions;
   private Timestamp startTime;
   private double frequency;
   private long startFrame;
   private List<Pause> pauseList;

   public ActionsForMatlab(List<Action> actions, Timestamp startTime, double frequency, long startFrame, List<Pause> pauseList)
   {
      this.actions = actions;
      this.startTime = startTime;
      this.frequency = frequency;
      this.startFrame = startFrame;
      this.pauseList = pauseList;
   }

   private long frameNumber(Timestamp time)
   {
      return Math.round(((time.getTime() - startTime.getTime() - pauseDurationBeforeTimeStamp(time))*frequency/1000 + startFrame));
   }

   private long pauseDurationBeforeTimeStamp(Timestamp time)
   {
      long pauseDuration = 0;
      for (Pause pause : pauseList) {
         if (pause.getEnd().before(time)) {
            pauseDuration += pause.duration();
         }
         else{
            break;
         }
      }
      return pauseDuration;
   }
   private boolean actionInAPause(Action action){
      for (Pause pause : pauseList) {
         if (pause.getStart().before(action.getStartTime()) && pause.getEnd().after(action.getStartTime())) {
            return true;
         }
      }
      return false;
   }

   private long endFrameNumber(Action action){
      return frameNumber(new Timestamp(action.getStartTime().getTime() + (long)action.getDuration().toMillis())); 
   }

   public void writeToFile(String fileName)
   {
      PrintWriter writer;
      try{
         writer = new PrintWriter(fileName);
      }
      catch(FileNotFoundException e){
         System.err.println(e);
         return;
      }

      for (Action action : actions) {
         if (!actionInAPause(action)){
            //writer.println(frameNumber(action.getTimestamp()) + " " + action.getMovement().name());  
            writer.println(frameNumber(action.getStartTime()) + " " + endFrameNumber(action) + " " + action.getMovement().name());  

         }
      }

      writer.close();
   }


}