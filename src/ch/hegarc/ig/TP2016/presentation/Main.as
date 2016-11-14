package ch.hegarc.ig.TP2016.presentation {

import ch.hegarc.ig.TP2016.presentation.controllers.LoginController;
import ch.hegarc.ig.TP2016.presentation.controllers.WelcomeController;
import ch.hegarc.ig.TP2016.presentation.screens.LoginScreen;
import ch.hegarc.ig.TP2016.presentation.screens.Screen;
import ch.hegarc.ig.TP2016.presentation.screens.WelcomeScreen;

import feathers.controls.Button;
import feathers.controls.Label;
import feathers.controls.LayoutGroup;
    import feathers.controls.TextCallout;
import feathers.controls.TextInput;
import feathers.layout.AnchorLayout;
import feathers.layout.HorizontalLayout;
import feathers.layout.VerticalLayout;
import feathers.themes.MetalWorksMobileTheme;

import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;

    public class Main extends LayoutGroup {

        //ECRANS
        /** Ecran d'accueil */
        private var _welcomeScreen:WelcomeScreen;
        /** Ecran de connexion **/
        private var _loginScreen:LoginScreen;
        /** Ecran courant */
        private var _currentScreen:Screen;

        //CONTROLEURS
        private var _loginController:LoginController;
        private var _welcomeControler:WelcomeController;

        //THEME
        private var _theme:MetalWorksMobileTheme;

        public function Main() {
            super();

            _theme = new MetalWorksMobileTheme();

            _loginController = new LoginController();
            _welcomeControler = new WelcomeController();

            _currentScreen = null;

            this.addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);
        }

        private function addedToStageHandler(event:starling.events.Event):void {
            // Supporte les ancres
            this.layout = new AnchorLayout();

            showWelcomeScreen();

            // Ecoute les évenements de changements d'écrans
            /*addEventListener(NavigationEvent.CHANGE_SCREEN, onChangeScreen);
            addEventListener(NavigationEvent.DECONNECTION, onDeconnection);
            addEventListener(starling.events.Event.FATAL_ERROR, onErrorOccured);
            */
        }

        /**
         * Affiche l'écran d'accueil
         */
        private function showWelcomeScreen():void {
            _welcomeScreen = new WelcomeScreen(_welcomeControler);
            this.addChild(_welcomeScreen);
            _currentScreen = _welcomeScreen;

            //_loginScreen.addEventListener(NavigationEvent.CONNECTION, onConnection);
        }

        /**
         * Affiche l'écran de login
         */
        private function showLoginScreen():void {
            _loginScreen = new LoginScreen(_loginController);
            this.addChild(_loginScreen);
            _currentScreen = _loginScreen;
        }

    }
}
