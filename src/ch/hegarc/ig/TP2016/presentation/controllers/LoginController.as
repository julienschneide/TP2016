/**
 * Created by Julien on 12.10.2016.
 */
package ch.hegarc.ig.TP2016.presentation.controllers {

import ch.hegarc.ig.TP2016.business.User;
import ch.hegarc.ig.TP2016.services.TP2016Services;

import starling.events.EventDispatcher;

    public class LoginController extends EventDispatcher{

        /** Utilisateur connecté */
        private var _user:User;

        public function LoginController() {
        }

        /**
         * Authentifie l'utilisateur en appelant le web service d'authentification
         * @param username Nom d'utilisateur saisi
         * @param password Mot de passe saisi
         */
        public function authentification(username:String, password:String):void{

            TP2016Services.getInstance().addEventListener(starling.events.Event.COMPLETE, authentificationCompleted)
            TP2016Services.getInstance().authentificate(username, password);
        }

        private function authentificationCompleted(event:starling.events.Event):void{
            TP2016Services.getInstance().removeEventListener(starling.events.Event.COMPLETE, authentificationCompleted);

        }

        public function logout():void{
            TP2016Services.getInstance().logout();
        }
    }
}
