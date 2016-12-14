/**
 * Created by julien.schneide on 14.12.2016.
 */
package ch.hegarc.ig.TP2016.presentation.controllers {
import ch.hegarc.ig.TP2016.services.TP2016Services;

import starling.events.EventDispatcher;

public class SpringController extends EventDispatcher{
    public function SpringController() {
    }

    public function toUpper(texte:String):void{
        TP2016Services.getInstance().addEventListener(starling.events.Event.COMPLETE, toUpperCompleted)
        TP2016Services.getInstance().toUpper(texte);
    }

    private function toUpperCompleted(event:starling.events.Event):void{
        TP2016Services.getInstance().removeEventListener(starling.events.Event.COMPLETE, toUpperCompleted);
        trace("Dans le controller : " + event.data.word);
    }
}
}
