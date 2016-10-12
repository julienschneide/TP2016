/**
 * Created by Julien on 12.10.2016.
 */
package ch.hegarc.ig.TP2016.presentation {

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;

import starling.core.Starling;

    [SWF(width="1920", height="1080", frameRate="60", backgroundColor="#fff444")]
    public class TP2016app extends Sprite{

        private var _starling:Starling;

        public function TP2016app() {

            if(this.stage)
            {
                this.stage.scaleMode = StageScaleMode.NO_SCALE;
                this.stage.align = StageAlign.TOP_RIGHT;
            }

            this.mouseEnabled = this.mouseChildren = false;

            this.loaderInfo.addEventListener(Event.COMPLETE, loaderInfo_completeHandler);
        }

        private function start(){
            this.graphics.clear();

            this._starling = new Starling(Main, stage);
            this._starling.supportHighResolutions = true;
            this._starling.skipUnchangedFrames = true;

            //this._starling.stage.stageWidth = 1920;
            //this._starling.stage.stageHeight = 1080;

            this._starling.start();
        }

        private function loaderInfo_completeHandler(event:Event):void
        {
            this.start();
        }

    }
}
