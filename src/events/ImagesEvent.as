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

    public var x:int;
    public var y:int;

    public var imageFileBig:String;

    public var x_changed:Boolean = false;
    public var y_changed:Boolean = false;

    public static const CLICK:String = "ImageClick";
    public static const MOVING:String = "ImageMoving";
    public static const LOAD_IMAGE:String = "LoadImage";

    public function ImagesEvent(type:String) {
        super(type);
    }


    override public function clone():Event {
        var imageEvent:ImagesEvent = new ImagesEvent(ImagesEvent.CLICK);
        imageEvent.imageFileBig = imageFileBig;
        return imageEvent;
    }
}
}
