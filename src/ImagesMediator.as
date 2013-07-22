/**
 * Created with IntelliJ IDEA.
 * User: Admin
 * Date: 22.07.13
 * Time: 14:06
 * To change this template use File | Settings | File Templates.
 */
package {
import events.CoreEvent;

import robotlegs.bender.bundles.mvcs.Mediator;

public class ImagesMediator extends Mediator {

    override public function initialize():void {
        trace('mediator initialized');
        addContextListener(CoreEvent.LOAD_XML, dispatch);
    }
}
}
