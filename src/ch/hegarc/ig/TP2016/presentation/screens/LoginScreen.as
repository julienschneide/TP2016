/**
 * Created by Julien on 12.10.2016.
 */
package ch.hegarc.ig.TP2016.presentation.screens {

    import ch.hegarc.ig.TP2016.presentation.controllers.LoginController;
    import ch.hegarc.ig.TP2016.presentation.screens.Screen;

    import feathers.controls.Button;
    import feathers.controls.Label;
    import feathers.controls.LayoutGroup;
    import feathers.layout.VerticalLayout;
    import feathers.controls.TextInput;

    import starling.events.Event;

    /**
     * Ecran permettant la connexion l'application
     */
    public class LoginScreen extends Screen{
        //Chjamp texte pour le nom d'utilisateur
        private var _username:TextInput;
        //Champ texte pour le mot de passe
        private var _password:TextInput;
        //Boutton de connexion
        private var _btnConnect:Button;
        /** Contrôleur de la vue, raccourci pour ne pas caster à chaque utilisation */
        private var _controller:LoginController;
        /** Clé de navigation pour cet écran */
        public static const NAVKEY:String="login";

        public function LoginScreen(controller:LoginController) {
            super(ViewType.DETAIL, controller);
            _controller = controller as LoginController;
        }

        override protected function initialize():void{
            super.initialize();

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
            _btnConnect.addEventListener(Event.TRIGGERED, connectionTriggered);
            group.addChild(_btnConnect);
        }

        private function connectionTriggered(event:Event){
            //Appel de la méthode d'authentification du controlleur
            _controller.authentification(_username.text, _password.text);
        }
    }
}
