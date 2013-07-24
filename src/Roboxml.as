package {

import models.ImageItemModel;

import robotlegsCore.CommandsConfig;
import robotlegsCore.MainConfig;
import robotlegsCore.MainContextBundle;

import events.CoreEvent;

import flash.display.Loader;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.IEventDispatcher;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.text.TextField;

import robotlegs.bender.bundles.mvcs.MVCSBundle;
import robotlegs.bender.extensions.contextView.ContextView;

import robotlegs.bender.framework.impl.Context;

import views.ImageItemView;

public class Roboxml extends Sprite {

    [Inject]
    public var eventBus:IEventDispatcher;

    public var imagesBig:Vector.<String>;
    public var imagesSmall:Vector.<String>;

    [PostConstruct]
    public function postConstruct():void {
        eventBus.dispatchEvent(new CoreEvent(CoreEvent.LOAD_XML));
    }

    public function Roboxml() {

        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        var context:Context = new Context();
        context.install(MVCSBundle).install(MainContextBundle).configure(MainConfig, CommandsConfig).configure(new ContextView(this)).initialize();
        context.injector.injectInto(this);

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
