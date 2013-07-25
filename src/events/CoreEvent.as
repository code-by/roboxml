/**
 * Created with IntelliJ IDEA.
 * User: Admin
 * Date: 22.07.13
 * Time: 18:11
 * To change this template use File | Settings | File Templates.
 */
package events {
import flash.events.Event;

public class CoreEvent extends Event {

    public static const LOAD_XML:String = 'LoadImagesXML';
    public static const SHOW_IMAGES:String = "ShowImages";

    public function CoreEvent(type:String) {
        super(type);
    }

}
}
