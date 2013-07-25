/**
 * Created with IntelliJ IDEA.
 * User: Admin
 * Date: 20.07.13
 * Time: 23:42
 * To change this template use File | Settings | File Templates.
 */
package views {
import events.ImagesEvent;

import flash.display.Loader;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.net.URLRequest;

import models.ImageItemModel;

public class ImageItemView extends Sprite
{

    private var _model:ImageItemModel;

    public function ImageItemView() {
       //addEventListener(MouseEvent.CLICK, onClick);
       addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {

    }

    public function get model():ImageItemModel {
        return _model;
    }

    public function set model(value:ImageItemModel):void {
        _model = value;
        model.addEventListener(ImagesEvent.MOVING, onMoving);
        model.addEventListener(ImagesEvent.LOAD_IMAGE, onLoadImage);
    }

    private function onLoadImage(event:ImagesEvent):void {
        trace('onLoadImage');
        var loader:Loader = new Loader();
        loader.load(new URLRequest('assets/' + _model.imageFileSmall));
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoaded);
    }

    private function onImageLoaded(event:Event):void {
        trace('onImageLoaded');
        event.target.removeEventListener(Event.COMPLETE, onImageLoaded);
        if (numChildren>0) {
            //removeChildren(0);
        }
        addChild(event.target.content);
    }

    private function onMoving(event:ImagesEvent):void {
        trace('view moving event');
        trace('x='+event.x+' y='+event.y);
        if (event.x_changed) {
            x = event.x;
        }
        if (event.y_changed) {
            y = event.y;
        }
    }
}
}
