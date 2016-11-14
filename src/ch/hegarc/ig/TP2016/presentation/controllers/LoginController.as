/**
 * Created by Julien on 12.10.2016.
 */
package ch.hegarc.ig.TP2016.presentation.controllers {

import ch.hegarc.ig.TP2016.business.User;

import flash.net.URLRequest;
import flash.net.URLRequestMethod;
import flash.net.URLVariables;
import flash.net.navigateToURL;

import starling.events.EventDispatcher;

public class LoginController extends EventDispatcher{

        /** Utilisateur connecté */
        private var _user:User;

        public function LoginController() {
        }

        public function authentification(username:String, password:String):void{

            //Create the HTTP request object
            var request = new URLRequest("http://localhost:8080/authLDAP")
            request.method = URLRequestMethod.GET;

            var variableUser = new URLVariables();
            variableUser.decode("username=" + username + "&password=" + password);

            request.data = variableUser;

            navigateToURL(request);



            trace(username + " " + password);
        }
    }
}
