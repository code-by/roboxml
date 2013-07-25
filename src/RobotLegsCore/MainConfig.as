/**
 * Created with IntelliJ IDEA.
 * User: Admin
 * Date: 19.07.13
 * Time: 23:44
 * To change this template use File | Settings | File Templates.
 */
package robotlegsCore {

import mediators.ImagesGalleryMediator;

import models.ImagesGalleryModel;

import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import views.ImagesGalleryView;

public class MainConfig implements IConfig {

    [Inject]
    public var injector:IInjector;

    [Inject]
    public var mediatorMap:IMediatorMap;

    public function configure():void {

        trace('injecting');
        injector.map(ImagesGalleryModel).asSingleton();

        trace('configure mediator');
        mediatorMap.map(ImagesGalleryView).toMediator(ImagesGalleryMediator); // for listen Gallery view
        mediatorMap.map(ImagesGalleryModel).toMediator(ImagesGalleryMediator); // Gallery model to Gallery mediator



    }
}
}