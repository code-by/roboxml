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

import views.ImageBigView;

import views.ImageItemView;
import views.ImagesGalleryView;

[SWF(width="1280", height="1024")]

public class Roboxml extends Sprite {

    [Inject]
    public var eventBus:IEventDispatcher;

    public function Roboxml() {

        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        var imagesGallery:ImagesGalleryView = new ImagesGalleryView();
        addChild(imagesGallery);

        var context:Context = new Context();
        context.install(MVCSBundle).install(MainContextBundle).configure(MainConfig, CommandsConfig).configure(new ContextView(this)).initialize();
        context.injector.injectInto(this);

        addChild(new ImageBigView());

    }

    [PostConstruct]
    public function postConstruct():void {
        eventBus.dispatchEvent(new CoreEvent(CoreEvent.LOAD_XML));
    }

}
}
