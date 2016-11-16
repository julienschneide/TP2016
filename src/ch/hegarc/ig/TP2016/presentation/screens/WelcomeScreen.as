/**
 * Created by Julien on 12.10.2016.
 */
package ch.hegarc.ig.TP2016.presentation.screens {

import ch.hegarc.ig.TP2016.presentation.controllers.WelcomeController;
import ch.hegarc.ig.TP2016.presentation.events.NavigationEvent;

import feathers.controls.Button;
import feathers.controls.Header;
import feathers.controls.Label;
import feathers.controls.LayoutGroup;
import feathers.controls.TextCallout;
import feathers.controls.TextInput;
import feathers.layout.VerticalLayout;
import feathers.themes.MetalWorksMobileTheme;

    import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;


    public class WelcomeScreen extends Screen{

        private var _welcomeLabel:Label;
        private var _controller:WelcomeController;
        //Boutton de navigation vers Login Screen
        private var _btnNavLogin:Button;
        //Boutton fonction upper
        private var _tiToUpper:TextInput;
        private var _btnUpper:Button;
        private var _UpperLabel:Label;

        /** Clé de navigation pour cet écran */
        public static const NAVKEY:String="welcome";

        public function WelcomeScreen(controller:WelcomeController) {
            super(ViewType.DETAIL, controller);
            _controller = controller as WelcomeController;
        }

        override protected function initialize():void{
            super.initialize();
            super.title = "Welcome";

            var group:LayoutGroup = new LayoutGroup();
            this.addChild( group );
            var layout:VerticalLayout = new VerticalLayout();
            layout.gap = 10;
            group.layout = layout;

            _welcomeLabel = new Label();
            _welcomeLabel.text = "Bienvenue dans l'application TP2016";
            group.addChild(_welcomeLabel);

            _btnNavLogin = new Button();
            _btnNavLogin.label = "Vers la page de Login";
            _btnNavLogin.addEventListener(Event.TRIGGERED, goToLoginScreen);
            group.addChild(_btnNavLogin);

            _tiToUpper = new TextInput();
            _tiToUpper.text = "miniscule";
            _UpperLabel = new Label();
            _btnUpper = new Button();
            _btnUpper.label = "To UpperCase";
            _btnUpper.addEventListener(Event.TRIGGERED, toUpper);
            group.addChild(_tiToUpper);
            group.addChild(_UpperLabel);
            group.addChild(_btnUpper);
        }

        private function goToLoginScreen(event:Event):void
        {
            var navEvent:NavigationEvent = new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: LoginScreen.NAVKEY}, true);
            dispatchEvent(navEvent);
        }

        private function toUpper(event:Event):void{
            var uppered:String;
            uppered = _controller.toUpper(_tiToUpper.text);
            trace (uppered);
            _UpperLabel.text = uppered
        }
    }
}
