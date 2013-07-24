/**
 * Created with IntelliJ IDEA.
 * User: Admin
 * Date: 22.07.13
 * Time: 14:06
 * To change this template use File | Settings | File Templates.
 */
package mediators {
import events.CoreEvent;
import events.ImagesEvent;

import robotlegs.bender.bundles.mvcs.Mediator;

import views.ImagesGallery;

public class GalleryMediator extends Mediator {

    [Inject]
    public var imageGallery:ImagesGallery;

    override public function initialize():void {
        trace('gallery mediator initialized');
        addContextListener(ImagesEvent.SHOW_IMAGES, showImages);
    }

    private function showImages(event:ImagesEvent):void {
        trace('showImages called');
    }
}
}
