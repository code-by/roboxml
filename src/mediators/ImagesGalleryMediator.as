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

import views.ImageBigView;

import views.ImageItemView;

import views.ImagesGalleryView;

public class ImagesGalleryMediator extends Mediator {

    [Inject]
    public var imagesGalleryView:ImagesGalleryView;

    [Inject]
    public var imagesGalleryModel:ImagesGalleryModel;

    [Inject]
    public var imageBigView:ImageBigView;


    override public function initialize():void {
        trace('gallery mediator initialized');
        addContextListener(ImagesEvent.CLICK, showBigImage);
    }

    private function showImages(event:ImagesEvent):void {
        trace('showImages called');
        imagesGalleryView.model = imagesGalleryModel;
        imagesGalleryView.updateModel();
    }

    private function showBigImage(event:ImagesEvent):void {
        trace('showBigImage called');
        imageBigView.loadImage(event.imageFileBig);
    }

}
}
