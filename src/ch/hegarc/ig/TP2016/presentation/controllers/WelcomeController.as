/**
 * Created by Julien on 19.10.2016.
 */
package ch.hegarc.ig.TP2016.presentation.controllers {
import ch.hegarc.ig.TP2016.services.TP2016Services;
import ch.hegarc.ig.TP2016.utilities.Constantes;

import flash.events.Event;

import flash.events.HTTPStatusEvent;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;

import flash.net.URLLoader;
import flash.net.URLLoaderDataFormat;

import flash.net.URLRequest;
import flash.net.URLRequestMethod;
import flash.net.URLVariables;

//import starling.events.Event;

public class WelcomeController {

        private var upperWord:String = new String();

        public function WelcomeController() {
        }

        public function toUpper(texte:String):String{
            var texteUpper:String = new String();
            var request:URLRequest = new URLRequest(Constantes.TOUPPER_URL)
            request.method = URLRequestMethod.GET;

            var varURL:URLVariables = new URLVariables();
            varURL.toUpper = texte;

            request.data = varURL;
            var postLoader:URLLoader = new URLLoader;

            postLoader.dataFormat = URLLoaderDataFormat.BINARY;

            postLoader.addEventListener( HTTPStatusEvent.HTTP_RESPONSE_STATUS, onHttpResponseStatus);
            postLoader.addEventListener( HTTPStatusEvent.HTTP_STATUS, onStatus);
            postLoader.addEventListener( Event.COMPLETE, httpRequestComplete);
            postLoader.addEventListener( IOErrorEvent.IO_ERROR, httpRequestIOError );
            postLoader.addEventListener( SecurityErrorEvent.SECURITY_ERROR, httpRequestSecurityError );

            postLoader.load(request);
            return upperWord;
            /*try
            {
                postLoader.load(request);
                trace ("data postaload : " + postLoader.data);
                texteUpper = postLoader.data.toString();
                trace (texteUpper);
            }
            catch (error:Error)
            {
                trace ("Unable to load post URL");

            }
            trace ("texte upper : " + texteUpper);
            trace("texte base : " +texte);
            return texteUpper;*/
        }

    private function onHttpResponseStatus(e:HTTPStatusEvent):void{
        trace("WSClientJSON.onHttpResponseStatus : " + e.status + " " + e.type + " " + e.responseURL);
    }

    private function onStatus(e:HTTPStatusEvent):void{
        trace("WSClientJSON.onStatus : " + e.status + " " + e.type + " " + e.responseURL);
    }

    public function httpRequestComplete( event:Event ):void {
        trace("WSClientJSON Loaded data : " + event.target.data.toString());
        upperWord = event.target.data.toString();
    }

    public function httpRequestIOError( error:IOErrorEvent ):void{
        trace("WSClientJSON.httpRequestIOError : " + error.errorID + " " + error.text);
    }

    public function httpRequestSecurityError( securityError:SecurityErrorEvent ):void{
        trace("WSClientJSON.httpRequestSecurityError : " + securityError.errorID + " " + securityError.text);
    }

    }
}
