/**
 * Created with IntelliJ IDEA.
 * User: Admin
 * Date: 23.07.13
 * Time: 17:44
 * To change this template use File | Settings | File Templates.
 */
package commands {
import robotlegs.bender.bundles.mvcs.Command;

public class ShowImages extends Command {

    public function ShowImages() {
    }

    override public function execute():void {
        trace('Show images command executed');
    }

}
}
