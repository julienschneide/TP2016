/**
 * Created by Julien on 12.10.2016.
 */
package ch.hegarc.ig.TP2016.presentation {

import ch.hegarc.ig.TP2016.app.Main;

import flash.display.Sprite;

import starling.core.Starling;

    [SWF(width="1920", height="1080", frameRate="60", backgroundColor="#fff444")]
    public class TP2016app extends Sprite{

        private var _starling:Starling;

        public function TP2016app() {
            _starling = new Starling(Main, stage);
            _starling.start();
        }
    }
}
