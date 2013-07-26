/**
 * Created with IntelliJ IDEA.
 * User: Admin
 * Date: 26.07.13
 * Time: 15:50
 * To change this template use File | Settings | File Templates.
 */
package mediators {
import events.ImagesEvent;

import robotlegs.bender.bundles.mvcs.Mediator;

import views.ImageItemView;

public class ImageItemMediator extends Mediator {

    // ONLY ONE MEDIATOR FOR ONE VIEW

    [Inject]
    public var imageItemView:ImageItemView;

    override public function initialize():void {
        trace('gallery mediator initialized');
        addViewListener(ImagesEvent.CLICK, showBigImage);
    }

    private function showBigImage(event:ImagesEvent):void {
        trace('showBigImage called - ImageItemMediator');
        dispatch(event);
    }

}
}
