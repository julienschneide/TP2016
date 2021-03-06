/**
 * Created by julien.schneide on 14.11.2016.
 */
package ch.hegarc.ig.TP2016.services {
import ch.hegarc.ig.TP2016.business.User;
import ch.hegarc.ig.TP2016.error.ServiceError;
import ch.hegarc.ig.TP2016.soa.clientshttp.WSClientJSON;
import ch.hegarc.ig.TP2016.utilities.Constantes;

import flash.utils.Dictionary;

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

    /**
     * Service permettant d'authentifier une personne
     * @param username Nom d'utilisateur saisi
     * @param password Mot de passe saisi
     */
    public function authentificate(username:String, password:String):void{
        var url:String = Constantes.LOGIN_URL;
        var params:Dictionary = new Dictionary();
        params["username"] = username;
        params["password"] = password;
        new WSClientJSON(url, params, authentificationCompleted, webServiceError);
    }

    private function authentificationCompleted(json:Object):void{
        trace(json.login + json.connectedUser);

        var message:Object = new Object();
        message.login = json.login;
        dispatchEventWith(starling.events.Event.COMPLETE, false, message);

        /*if (json.login = "SUCCESS"){
            var user:User = new User()
        }*/
    }

    public function logout():void{
        var url:String = Constantes.LOGOUT_URL;
        var params:Dictionary = new Dictionary();
        new WSClientJSON(url, params, logoutCompleted, webServiceError);
    }

    private function logoutCompleted(json:Object):void{

    }

    public function toUpper(texte:String):void{
        var url:String = Constantes.TOUPPER_URL;
        var params:Dictionary = new Dictionary();
        params["toUpper"] = texte;
        new WSClientJSON(url, params, toUpperCompleted, webServiceError);
    }

    private function toUpperCompleted(json:Object):void{
        var message:Object = new Object();
        message.word = json.word;

        trace("service Mot majusucle : " + json.word);
        dispatchEventWith(starling.events.Event.COMPLETE, false, message);
    }

    /**
     * Récupère l'erreur rencontrée et la répend
     * @param errorId
     */
    private function webServiceError(errorId:int):void{
        var error:ServiceError = new ServiceError(errorId, "Une erreur a été rencontrée...");
        dispatchEventWith(starling.events.Event.FATAL_ERROR, false, error);
    }
}
}
