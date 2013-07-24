/**
 * Created with IntelliJ IDEA.
 * User: Admin
 * Date: 19.07.13
 * Time: 23:44
 * To change this template use File | Settings | File Templates.
 */
package robotlegsCore {
import events.CoreEvent;

import mediators.CoreMediator;

import models.ImagesGalleryModel;

import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import views.ImageItemView;

public class MainConfig implements IConfig {

    [Inject]
    public var injector:IInjector;

    [Inject]
    public var mediatorMap:IMediatorMap;

    public function configure():void {

        trace('injecting');
        injector.map(ImagesGalleryModel).asSingleton();

        trace('configure mediator');
        mediatorMap.map(ImageItemView).toMediator(CoreMediator); // XML Loaded

    }
}
}