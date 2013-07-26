/**
 * Created with IntelliJ IDEA.
 * User: Admin
 * Date: 24.07.13
 * Time: 21:12
 * To change this template use File | Settings | File Templates.
 */
package views {
import flash.display.Sprite;

import models.ImageItemModel;

import models.ImagesGalleryModel;

public class ImagesGalleryView extends Sprite {

    private var _model:ImagesGalleryModel;

    public function ImagesGalleryView() {
        this.x = 0;
        this.y = 0;
    }

    public function set model(value:ImagesGalleryModel):void {
        _model = value;
    }

    public function updateModel() {

        trace('Update gallery view model');

        const imagesPerRow:uint = 6;
        var imageItemView:ImageItemView;
        var imageItemModel:ImageItemModel;

        trace('Images count: '+_model.imageModels.length);

        for(var i:uint = 0; i < _model.imageModels.length; i++) {

            trace('--------------------');
            trace('CREATE IMAGE #'+i);

            imageItemView = new ImageItemView();
            imageItemModel = new ImageItemModel();
            imageItemView.model = imageItemModel;

            imageItemModel.imageFileBig = _model.imageModels[i].imageFileBig;
            imageItemModel.imageFileSmall = _model.imageModels[i].imageFileSmall;
            imageItemModel.loadImage();

            trace(imageItemModel.imageFileBig+' '+imageItemModel.imageFileSmall);

            imageItemModel.x = 10 + (i % imagesPerRow)*210;
            imageItemModel.y = 10 + (Math.floor(i / imagesPerRow) * 160);

            trace('set x='+imageItemModel.x+' y='+imageItemModel.y);

            addChild(imageItemView);

        }

        //imageGallery.width = 10 + imagesPerRow * 150;
        //imageGallery.height = 10 + (Math.floor((imagesGalleryModel.imageModels.length - 1) / imagesPerRow) * 110);

        trace('done');

    }

}
}
