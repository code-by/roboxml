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

import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;

import models.ImageItemModel;
import models.ImagesGalleryModel;

import robotlegs.bender.bundles.mvcs.Mediator;

import views.ImageItemView;

import views.ImagesGalleryView;

public class ImagesGalleryMediator extends Mediator {

    [Inject]
    public var imagesGalleryView:ImagesGalleryView;

    [Inject]
    public var imagesGalleryModel:ImagesGalleryModel;

    override public function initialize():void {
        trace('gallery mediator initialized');
        addContextListener(CoreEvent.SHOW_IMAGES, showImages);
    }

    private function showImages(event:ImagesEvent):void {
        trace('showImages called');

        imagesGalleryView.model = imagesGalleryModel;
        imagesGalleryView.updateModel();

    }

}
}
