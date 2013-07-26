/**
 * Created with IntelliJ IDEA.
 * User: Admin
 * Date: 26.07.13
 * Time: 13:46
 * To change this template use File | Settings | File Templates.
 */
package views {
import flash.display.Loader;
import flash.display.Sprite;
import flash.events.Event;
import flash.net.URLRequest;

public class ImageBigView extends Sprite {

    public function ImageBigView():void {
        trace('ImageBigView constructor');
        x = 20;
        y = 20;
    }

    public function loadImage(fileName:String) {
        trace('onLoadImage');
        if (fileName!='') {
            var loader:Loader = new Loader();
            loader.load(new URLRequest('assets/' + fileName));
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoaded);
        }
    }

    private function onImageLoaded(event:Event):void {
        trace('onImageLoaded');
        event.target.removeEventListener(Event.COMPLETE, onImageLoaded);
        if (numChildren>0) {
            removeChildren(0);
        }
        addChild(event.target.content);
    }

}
}
