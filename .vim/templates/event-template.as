package {

  import flash.events.Event;

  /**
   *
   *  @author Hideaki Tanabe
   */
  public class CustomEvent extends Event {

    /**
     *  コンストラクタ
     *  @param type イベントタイプ
     */
    public function CustomEvent(type:String) {
      super(type);
    }
  }
}
