/**
 * Created by julien.schneide on 14.11.2016.
 */
package ch.hegarc.ig.TP2016.utilities {

    /**
     * Classe gérant les emplacements des fichiers et serveur nécessaire au fonctionnement de l'application
     */
    public class Constantes {

        public static const SERVER_ROOT_URL:String = "http://localhost:8080/";

        // Adresse des web services //
        public static const LOGIN_URL:String = SERVER_ROOT_URL + "login";
        public static const LOGOUT_URL:String = SERVER_ROOT_URL + "logout";
        public static const TOUPPER_URL:String = SERVER_ROOT_URL + "upper";

        public static const CONTENT_TYPE_BINARY:String = "application/octet-stream";
        public static const CONTENT_TYPE_JSON:String = "application/json";
        public static const CONTENT_TYPE_TEXT:String = "application/text";
        public static const CONTENT_TYPE_FORM:String = "application/x-www-form-urlencoded";




    }
}
