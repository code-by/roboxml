package {

import flash.display.Loader;
import flash.display.Sprite;
import flash.events.Event;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.text.TextField;

import robotlegs.bender.bundles.mvcs.MVCSBundle;
import robotlegs.bender.extensions.contextView.ContextView;

import robotlegs.bender.framework.impl.Context;

public class Roboxml extends Sprite {

    public var imagesBig:Vector.<String>;
    public var imagesSmall:Vector.<String>;

    public function Roboxml() {

        var context:Context = new Context();
        context.install(MVCSBundle).install(MainContextBundle).configure(MainConfig).configure(CommandsConfig).configure(new ContextView(this)).initialize();
        context.injector.injectInto(this);

        var xmlLoader:URLLoader = new URLLoader();

        xmlLoader.addEventListener(Event.COMPLETE, LoadXML);
        xmlLoader.load(new URLRequest("assets/images.xml"));

    }


    private function LoadXML(e:Event):void {
        var xmlData:XML = new XML(e.target.data);
        trace(xmlData);

        imagesBig = new Vector.<String>;
        imagesSmall = new Vector.<String>;

        var len:int = xmlData.image.length();
        trace(len);
        for (var i:int = 0; i < len; i++)
        {
            imagesBig.push(xmlData.image[i].@bname);
            imagesSmall.push(xmlData.image[i].@sname);
        }

        loadImages();

        trace('ok');
    }

    private function loadImages():void {

        const imagesPerRow:uint = 5;
        var imageItemView:ImageItemView;
        var imageItemModel:ImageItemModel;

        for(var i:uint = 0;i<imagesBig.length;i++) {

            imageItemView = new ImageItemView();
            imageItemModel.imageFileBig = imagesBig[i];
            imageItemModel.imageFileSmall = imagesSmall[i];

            trace(imagesBig[i]+' '+imagesSmall[i]);

            var loader:Loader = new Loader();
            loader.load(new URLRequest('assets/' + imageItemModel.imageFileSmall));
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoaded);

            //addChild(imageItemView);

            imageItemView.x = 10 + (i % 4)*110;
            imageItemView.y = 10 + (Math.floor(i / imagesPerRow) * 110);

        }

    }

    private function onImageLoaded(event:Event):void {
        event.target.removeEventListener(Event.COMPLETE, onImageLoaded);
        addChild(event.target.content);
    }

}
}
