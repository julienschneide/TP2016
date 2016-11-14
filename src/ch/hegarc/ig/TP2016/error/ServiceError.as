/**
 * Created by julien.schneide on 14.11.2016.
 */
package ch.hegarc.ig.TP2016.error {

    /** Erreur de service */
    public class ServiceError extends Error {

           /** Message d'erreur utilisateur */
            private var _message:String;

            public function ServiceError(code:int, message:String) {
                super (message, code);
            }

            public function showTechnicalMessage():String {
                return super.errorID + ": " + super.message;
            }
    }

}
