import java.sql.Timestamp;
import javafx.util.Duration;

public class ButtonAction{
   public Timestamp time;
   public boolean isPause; //else it is play

   public ButtonAction(Timestamp time, boolean isPause)
   {
      this.time = time;
      this.isPause = isPause;
   }
}