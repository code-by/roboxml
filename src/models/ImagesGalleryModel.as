/**
 * Created with IntelliJ IDEA.
 * User: Admin
 * Date: 22.07.13
 * Time: 17:47
 * To change this template use File | Settings | File Templates.
 */
package models {
public class ImagesGalleryModel {

    public var imageModels:Vector.<ImageItemModel>;

    // Stores filenames of all images in gallery

    public function ImagesGalleryModel() {
        imageModels = new Vector.<ImageItemModel>();
    }

}
}
