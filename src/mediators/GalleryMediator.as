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

public class GalleryMediator extends Mediator {

    override public function initialize():void {
        trace('mediator initialized');
        addContextListener(ImagesEvent.SHOW_IMAGES, dispatch);
    }
}
}
