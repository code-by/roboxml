/**
 * Created with IntelliJ IDEA.
 * User: Admin
 * Date: 23.07.13
 * Time: 17:41
 * To change this template use File | Settings | File Templates.
 */
package events {
import flash.events.Event;

public class ImagesEvent extends Event {

    public static const SHOW_IMAGES:String = "ShowImages";

    public function ImagesEvent(type:String) {
        super(type);
    }



}
}
