/**
 * Created with IntelliJ IDEA.
 * User: Admin
 * Date: 22.07.13
 * Time: 16:53
 * To change this template use File | Settings | File Templates.
 */
package commands {
import flash.events.Event;
import flash.net.URLLoader;
import flash.net.URLRequest;

import robotlegs.bender.bundles.mvcs.Command;

public class LoadImagesXML extends Command {

    [Inject]
    public var imageModels:ImagesGalleryModel;

    override public function execute():void {

        trace('execute LoadImagesXML');

        var xmlLoader:URLLoader = new URLLoader();

        xmlLoader.addEventListener(Event.COMPLETE, proceedXML);
        xmlLoader.load(new URLRequest("assets/images.xml"));
    }

    private function proceedXML(e:Event):void {

        var xmlData:XML = new XML(e.target.data);
        var imageModel:ImageItemModel;

        for (var i:int = 0; i < xmlData.image.length(); i++)
        {

            imageModel = new ImageItemModel();

            imageModel.imageFileBig = xmlData.image[i].@bname
            imageModel.imageFileSmall = xmlData.image[i].@sname
        }

        trace('ok');
    }

}
}
