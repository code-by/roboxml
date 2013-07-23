/**
 * Created with IntelliJ IDEA.
 * User: Admin
 * Date: 22.07.13
 * Time: 16:53
 * To change this template use File | Settings | File Templates.
 */
package commands {
import events.ImagesEvent;

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import flash.net.URLLoader;
import flash.net.URLRequest;

import org.osmf.elements.ImageElement;

import robotlegs.bender.bundles.mvcs.Command;
import robotlegs.bender.extensions.eventDispatcher.EventDispatcherExtension;

public class LoadImagesXML extends Command {

    [Inject]
    public var imageModelsGallery:ImagesGalleryModel;

    [Inject]
    public var eventBus:IEventDispatcher;

    override public function execute():void {

        trace('execute LoadImagesXML');

        var xmlLoader:URLLoader = new URLLoader();

        xmlLoader.addEventListener(Event.COMPLETE, proceedXML);
        xmlLoader.load(new URLRequest("assets/images.xml"));
    }

    private function proceedXML(e:Event):void {

        var xmlData:XML = new XML(e.target.data);
        var imageModel:ImageItemModel;

        imageModelsGallery = new ImagesGalleryModel();

        trace(imageModelsGallery);

        for (var i:int = 0; i < xmlData.image.length(); i++)
        {

            imageModel = new ImageItemModel();

            imageModel.imageFileBig = xmlData.image[i].@bname
            imageModel.imageFileSmall = xmlData.image[i].@sname

            imageModelsGallery.imageModels.push(imageModel);

        }

        trace('ok');

        eventBus.dispatchEvent(new ImagesEvent(ImagesEvent.SHOW_IMAGES));


    }

}
}
