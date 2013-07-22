/**
 * Created with IntelliJ IDEA.
 * User: Admin
 * Date: 19.07.13
 * Time: 23:44
 * To change this template use File | Settings | File Templates.
 */
package {
import events.CoreEvent;

import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;

import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

public class MainConfig implements IConfig {

    [Inject]
    public var injector:IInjector;

    [Inject]
    public var mediatorMap:IMediatorMap;

    public function configure():void {

        trace('injecting');
        injector.map(ImagesGalleryModel).asSingleton();

        trace('configure mediator');
        mediatorMap.map(ImageItemView).toMediator(ImagesMediator);



    }
}
}
