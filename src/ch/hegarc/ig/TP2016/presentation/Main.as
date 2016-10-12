package ch.hegarc.ig.TP2016.presentation {

    import feathers.controls.Button;
import feathers.controls.Label;
import feathers.controls.LayoutGroup;
    import feathers.controls.TextCallout;
import feathers.controls.TextInput;
import feathers.layout.HorizontalLayout;
import feathers.layout.VerticalLayout;
import feathers.themes.MetalWorksMobileTheme;

import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;

    public class Main extends Sprite {

        //ECRANS
        //private var _welcomeScreen


        private var _username:TextInput;
        private var _password:TextInput;
        //Boutton de connexion
        private var _btnConnect:Button;


        public function Main() {

            new MetalWorksMobileTheme();

            var group:LayoutGroup = new LayoutGroup();
            this.addChild( group );
            var layout:VerticalLayout = new VerticalLayout();
            layout.gap = 10;
            group.layout = layout;

            var usernameLabel:Label = new Label();
            usernameLabel.text = "Nom d'utilisateur";
            _username = new TextInput();
            _username.width = 200;
            group.addChild(usernameLabel);
            group.addChild(_username);

            var passwrodLabel:Label = new Label();
            passwrodLabel.text = "Mot de passe";
            _password = new TextInput();
            _password.width = 200;
            _password.displayAsPassword = true;
            group.addChild(passwrodLabel);
            group.addChild(_password);

            _btnConnect = new Button();
            _btnConnect.label = "Se connecter";
            //_btnConnect.addEventListener(Event.TRIGGERED, seConnecter(_username.text,_password.text));
            _btnConnect.addEventListener(Event.TRIGGERED, seConnecter);
            group.addChild(_btnConnect);
        }

        private function seConnecter(event:Event){
            trace(_username.text);
        }
    }
}
