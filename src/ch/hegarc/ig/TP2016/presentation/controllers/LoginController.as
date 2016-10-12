/**
 * Created by Julien on 12.10.2016.
 */
package ch.hegarc.ig.TP2016.presentation.controllers {

import ch.hegarc.ig.TP2016.business.User;

    public class LoginController {

        /** Utilisateur connecté */
        private var _user:User;

        public function LoginController() {
        }

        public function authentification(username:String, password:String):void{
            trace(username + " " + password);
        }
    }
}
