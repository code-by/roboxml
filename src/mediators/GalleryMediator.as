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

import views.ImagesGallery;

public class GalleryMediator extends Mediator {

    [Inject]
    public var imageGallery:ImagesGallery;

    [Inject]
    public var imagesGalleryModel:ImagesGalleryModel;

    override public function initialize():void {
        trace('gallery mediator initialized');
        addContextListener(CoreEvent.SHOW_IMAGES, showImages);
    }

    private function showImages(event:ImagesEvent):void {
        trace('showImages called');

        const imagesPerRow:uint = 6;
        var imageItemView:ImageItemView;
        var imageItemModel:ImageItemModel;

        trace('Images count: '+imagesGalleryModel.imageModels.length);

        for(var i:uint = 0;i<imagesGalleryModel.imageModels.length-1;i++) {

            trace('--------------------');
            trace('CREATE IMAGE #'+i);

            imageItemView = new ImageItemView();
            imageItemModel = new ImageItemModel();
            imageItemView.model = imageItemModel;

            imageItemModel.imageFileBig = imagesGalleryModel.imageModels[i].imageFileBig;
            imageItemModel.imageFileSmall = imagesGalleryModel.imageModels[i].imageFileSmall;
            imageItemModel.loadImage();

            trace(imageItemModel.imageFileBig+' '+imageItemModel.imageFileSmall);

            imageItemModel.x = 10 + (i % 4)*210;
            imageItemModel.y = 10 + (Math.floor(i / imagesPerRow) * 160);

            trace('set x='+imageItemModel.x+' y='+imageItemModel.y);

            imageGallery.addChild(imageItemView);

        }

        //imageGallery.width = 10 + imagesPerRow * 150;
        //imageGallery.height = 10 + (Math.floor((imagesGalleryModel.imageModels.length - 1) / imagesPerRow) * 110);

        trace('done');

    }

}
}
