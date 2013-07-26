/**
 * Created with IntelliJ IDEA.
 * User: Admin
 * Date: 26.07.13
 * Time: 16:14
 * To change this template use File | Settings | File Templates.
 */
package mediators {
import events.ImagesEvent;

import robotlegs.bender.bundles.mvcs.Mediator;

import views.ImageBigView;

public class ImageBigMediator extends Mediator {

    [Inject]
    public var imageBigView:ImageBigView;

    override public function initialize():void {
        trace('gallery mediator initialized');
        addContextListener(ImagesEvent.CLICK, showBigImage);
    }

    private function showBigImage(event:ImagesEvent):void {
        trace('showBigImage called - ImageBigediator');
        imageBigView.loadImage(event.imageFileBig);
    }


}
}
