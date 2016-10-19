import java.sql.Timestamp;
import javafx.util.Duration;

public class Pause{
   private Timestamp start;
   private Timestamp end;

   public Pause(Timestamp start, Timestamp end)
   {
      this.start = start;
      this.end = end;
   }

   public long duration(){
      return Long.sum(end.getTime(), -start.getTime());
   }
   public Timestamp getEnd(){
      return end;
   }
   public Timestamp getStart(){
      return start;
   }

}