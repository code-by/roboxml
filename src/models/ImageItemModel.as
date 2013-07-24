/**
 * Created with IntelliJ IDEA.
 * User: Admin
 * Date: 22.07.13
 * Time: 13:32
 * To change this template use File | Settings | File Templates.
 */
package models {
import flash.events.EventDispatcher;

public class ImageItemModel extends EventDispatcher {

    private var _x:int;
    private var _y:int;

    private var _imageFileSmall:String;
    private var _imageFileBig:String;

    public function ImageItemModel() {
    }


    public function set imageFileSmall(value:String):void {
        _imageFileSmall = value;
    }

    public function set imageFileBig(value:String):void {
        _imageFileBig = value;
    }

    public function get imageFileBig():String {
        return _imageFileBig;
    }

    public function get imageFileSmall():String {
        return _imageFileSmall;
    }

}
}
