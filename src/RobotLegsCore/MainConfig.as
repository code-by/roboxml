/**
 * Created with IntelliJ IDEA.
 * User: Admin
 * Date: 19.07.13
 * Time: 23:44
 * To change this template use File | Settings | File Templates.
 */
package robotlegsCore {

import mediators.ImageBigMediator;
import mediators.ImageItemMediator;
import mediators.ImagesGalleryMediator;

import models.ImagesGalleryModel;

import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import views.ImageBigView;
import views.ImageItemView;

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
        // ONLY ONE MEDIATOR FOR ONE VIEW !
        mediatorMap.map(ImagesGalleryView).toMediator(ImagesGalleryMediator); // for listen Gallery view
        mediatorMap.map(ImagesGalleryModel).toMediator(ImagesGalleryMediator); // Gallery model to Gallery mediator
        mediatorMap.map(ImageItemView).toMediator(ImageItemMediator); // for listen ImagesItemView click and dispatch to ImageBigMediator
        mediatorMap.map(ImageBigView).toMediator(ImageBigMediator); // for listen ImageBigView click

    }
}
}