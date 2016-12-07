/**
 * Created by Julien on 12.10.2016.
 */
package ch.hegarc.ig.TP2016.business {

    public class User {

        private var _id:int;
        private var _username:String;
        private var _password:String;
        private var _firstname:String;
        private var _lastname:String;
        private var _email:String;

        public function User() {
        }

        public function get id():int {
            return _id;
        }

        public function set id(value:int):void {
            _id = value;
        }

        public function get username():String {
            return _username;
        }

        public function set username(value:String):void {
            _username = value;
        }

        public function get password():String {
            return _password;
        }

        public function set password(value:String):void {
            _password = value;
        }

        public function get firstname():String {
            return _firstname;
        }

        public function set firstname(value:String):void {
            _firstname = value;
        }

        public function get lastname():String {
            return _lastname;
        }

        public function set lastname(value:String):void {
            _lastname = value;
        }

        public function get email():String {
            return _email;
        }

        public function set email(value:String):void {
            _email = value;
        }
    }
}
