/**
 * Created with IntelliJ IDEA.
 * User: Admin
 * Date: 20.07.13
 * Time: 23:42
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

public class ImageItemView extends Sprite
{

    public function ImageItemView() {
       //addEventListener(MouseEvent.CLICK, onClick);
       addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {

    }

}
}
