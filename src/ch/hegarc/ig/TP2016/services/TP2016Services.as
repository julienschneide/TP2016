/**
 * Created by julien.schneide on 14.11.2016.
 */
package ch.hegarc.ig.TP2016.services {
import starling.events.EventDispatcher;

public class TP2016Services extends EventDispatcher{

    private static var _instance:TP2016Services = null;

    public function TP2016Services() {
        // throw new Error("Error, StoriaBoxEditorServices is a singleton. Please use the method getInstance instead.");
    }

    public static function getInstance():TP2016Services {
        if(_instance == null){
            _instance = new TP2016Services();
        }

        return _instance;
    }
}
}
