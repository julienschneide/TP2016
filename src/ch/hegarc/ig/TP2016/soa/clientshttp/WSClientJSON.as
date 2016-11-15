/**
 *
 * MTIS Mobile
 * http://mtis.ig.he-arc.ch
 * version 1.0
 * 
 * Copyright (c) 2015 MTIS. All rights reserved.
 *  
 */
package  ch.hegarc.ig.TP2016.soa.clientshttp
{
import ch.hegarc.ig.TP2016.utilities.Constantes;

import flash.utils.Dictionary;
import flash.net.URLVariables;
import flash.net.URLRequest;
import flash.net.URLLoader;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.events.EventDispatcher;
import flash.events.HTTPStatusEvent;
import flash.events.Event;
import flash.net.URLRequestMethod;
	
	
	/**
	 * Client HTTP effectuant les requêtes vers un service web.
	 * Attend une réponse du WS au format JSON. Si tel est le cas, va transmettre un Dictionary avec la réponse à la fonction successHandler
	 *
	 * @author Julien Plumez
	 * 
	 */
	public class WSClientJSON extends EventDispatcher
	{
		
		/** Outils pour l'envoie d'une requête HTTP vers les serveurs MTIS */
		private var _request:URLRequest;
		private var _requestLoader:URLLoader;
		private var _urlVariables:URLVariables;
		
		private var _successHandler:Function;
		private var _failHandler:Function;
		
		private var _statusCode:Number;
		
		public function WSClientJSON(url:String, params:Dictionary, successHandler:Function, failHandler:Function){
			_successHandler = successHandler;
			_failHandler = failHandler;
			
			_request = new URLRequest(url);
			_request.contentType = Constantes.CONTENT_TYPE_FORM; // Nécessaire pour passer les paramètres en POST ! Sinon ils ne sont pas traités sur le serveur
			_request.method = URLRequestMethod.POST;
			
			if(params){
				_urlVariables = new URLVariables();
				
				for (var key:String in params) {
					_urlVariables[key.toString()] = params[key];
				}
				
				/*_urlVariables[Constantes.PARAM_APP_VERSION] = FilesManager.APP_VERSION;
				_urlVariables[Constantes.PARAM_DEVICE_UID] = ApplicationManager.getInstance().getDeviceUniqueId();*/
				
				_request.data = _urlVariables;
			}
			
			_requestLoader = new URLLoader(); 
			
			_requestLoader.addEventListener( HTTPStatusEvent.HTTP_RESPONSE_STATUS, onHttpResponseStatus);
			_requestLoader.addEventListener( HTTPStatusEvent.HTTP_STATUS, onStatus);
			_requestLoader.addEventListener( Event.COMPLETE, httpRequestComplete);
			_requestLoader.addEventListener( IOErrorEvent.IO_ERROR, httpRequestIOError );
			_requestLoader.addEventListener( SecurityErrorEvent.SECURITY_ERROR, httpRequestSecurityError );
			
			_requestLoader.load( _request );
		}
		
		private function onHttpResponseStatus(e:HTTPStatusEvent):void{
			 trace("WSClientJSON.onHttpResponseStatus : " + e.status + " " + e.type + " " + e.responseURL);
			_statusCode = e.status;
		}
		
		private function onStatus(e:HTTPStatusEvent):void{
			trace("WSClientJSON.onStatus : " + e.status + " " + e.type + " " + e.responseURL);
		}
		
		public function httpRequestComplete( event:Event ):void {
			try{
				if(_statusCode == 200){
					trace("WSClientJSON Loaded data : " + event.target.data.toString());
					//var jsonResult:Object = JSON.parse(event.target.data);
					
					//_successHandler(jsonResult);
				}else{
					// ServicesLogs.onExceptionDetails("WSClientJSON", "Status code error", "Status code : " + _statusCode, null);
					trace("WSClientJSON", "Status code error", "Status code : " + _statusCode, null);
					_failHandler(_statusCode);
				}
				
			}catch(e:Error){
				trace("Exception in httpRequestComplete : " + e.getStackTrace());
				// ServicesLogs.onException(UtilsLogs.getClassName(this), e);
				_failHandler();
			}
			
			dispose();
		} 
		
		public function httpRequestIOError( error:IOErrorEvent ):void{
			trace("WSClientJSON.httpRequestIOError : " + error.errorID + " " + error.text);
			// ServicesLogs.onErrorEvent("WSClientJSON", error);
			_failHandler(error.errorID);
			dispose();
		}
		
		public function httpRequestSecurityError( securityError:SecurityErrorEvent ):void{
			trace("WSClientJSON.httpRequestSecurityError : " + securityError.errorID + " " + securityError.text);
			_failHandler();
			dispose();
		}
		
		public function dispose():void{
			if(_requestLoader){
				_requestLoader.removeEventListener( HTTPStatusEvent.HTTP_RESPONSE_STATUS, onHttpResponseStatus);
				_requestLoader.removeEventListener( HTTPStatusEvent.HTTP_STATUS, onStatus);
				_requestLoader.removeEventListener( Event.COMPLETE, httpRequestComplete); 
				_requestLoader.removeEventListener( IOErrorEvent.IO_ERROR, httpRequestIOError );
				_requestLoader.removeEventListener( SecurityErrorEvent.SECURITY_ERROR, httpRequestSecurityError );
				
				_requestLoader.close();
				_requestLoader = null;
			}
			
			_request = null;
			
		}
	}
}