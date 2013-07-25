/**
 * Created with IntelliJ IDEA.
 * User: Admin
 * Date: 22.07.13
 * Time: 13:32
 * To change this template use File | Settings | File Templates.
 */
package models {
import events.ImagesEvent;

import flash.display.Loader;
import flash.events.Event;

import flash.events.EventDispatcher;
import flash.net.URLRequest;

import org.osmf.elements.ImageElement;

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

    public function loadImage():void {
        trace('load image');
        dispatchEvent(new ImagesEvent(ImagesEvent.LOAD_IMAGE));
    }

    public function get x():int {
        return _x;
    }

    public function set x(value:int):void {
        _x = value;
        var movingEvent = new ImagesEvent(ImagesEvent.MOVING);
        movingEvent.x = x;
        movingEvent.x_changed = true;
        dispatchEvent(movingEvent);
    }

    public function get y():int {
        return _y;
    }

    public function set y(value:int):void {
        _y = value;
        var movingEvent = new ImagesEvent(ImagesEvent.MOVING);
        movingEvent.y = y;
        movingEvent.y_changed = true;
        dispatchEvent(movingEvent);

    }
}
}
