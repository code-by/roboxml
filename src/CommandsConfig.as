/**
 * Created with IntelliJ IDEA.
 * User: Admin
 * Date: 19.07.13
 * Time: 23:44
 * To change this template use File | Settings | File Templates.
 */
package {
import commands.LoadImagesXML;
import commands.ShowImages;

import events.CoreEvent;

import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;

import robotlegs.bender.framework.api.IConfig;

public class CommandsConfig implements IConfig {

    [Inject]
    public var commandMap:IEventCommandMap;

    public function configure():void {
        trace('commands config init');
        commandMap.map(CoreEvent.LOAD_XML, CoreEvent).toCommand(LoadImagesXML);
        commandMap.map(CoreEvent.LOAD_XML, CoreEvent).toCommand(ShowImages);
    }

}
}
