package {

  import flash.events.Event;
  import flash.display.MovieClip;

  /**
   *
   *  @author Hideaki Tanabe
   */
  public class Main extends MovieClip {

    /**
     *  コンストラクタ
     */
    public function Main() {
      stage ? initialize() : addEventListener(Event.ADDED_TO_STAGE, initialize);
    }

    /**
     *  初期化を行う
     *  @param event イベント
     */
    private function initialize(event:Event = null):void {
      removeEventListener(Event.ADDED_TO_STAGE, initialize);
    }
  }
}
