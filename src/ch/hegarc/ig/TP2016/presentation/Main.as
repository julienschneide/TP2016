package ch.hegarc.ig.TP2016.presentation {

import ch.hegarc.ig.TP2016.presentation.controllers.DiscussionsListController;
import ch.hegarc.ig.TP2016.presentation.controllers.LoginController;
import ch.hegarc.ig.TP2016.presentation.controllers.SpringController;
import ch.hegarc.ig.TP2016.presentation.controllers.WelcomeController;
import ch.hegarc.ig.TP2016.presentation.events.NavigationEvent;
import ch.hegarc.ig.TP2016.presentation.menu.MainMenu;
import ch.hegarc.ig.TP2016.presentation.screens.DiscussionsListScreen;
import ch.hegarc.ig.TP2016.presentation.screens.LoginScreen;
import ch.hegarc.ig.TP2016.presentation.screens.Screen;
import ch.hegarc.ig.TP2016.presentation.screens.SpringScreen;
import ch.hegarc.ig.TP2016.presentation.screens.ViewType;
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
        /** Ecran des services Spring **/
        private var _springScreen:SpringScreen;
        /** Ecran de listing des discussions Vanilla **/
        private var _DiscussionsListScreen:DiscussionsListScreen;
        /** Ecran courant */
        private var _currentScreen:Screen;
        /** Menu Principal */
        private var _menu:MainMenu;

        //CONTROLEURS
        /** Contrôleur de la vue Login */
        private var _loginController:LoginController;
        /** Contrôleur de la vue d'accueil */
        private var _welcomeControler:WelcomeController;
        /** Contrôleur de la vue Spring */
        private var _springControler:SpringController;
        /** Contrôleur de la vue de listing discussions Vanilla */
        private var _discussionsListControler:DiscussionsListController;


        //THEME
        private var _theme:MetalWorksMobileTheme;

        public function Main() {
            super();

            // Le thème est instancié une seule fois ici, les enfants dans la liste d'affichage hériteront du thème
            _theme = new MetalWorksMobileTheme();

            _loginController = new LoginController();
            _welcomeControler = new WelcomeController();
            _springControler = new SpringController();
            _discussionsListControler = new DiscussionsListController();

            _currentScreen = null;

            this.addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);
        }

        private function addedToStageHandler(event:starling.events.Event):void {
            // Supporte les ancres
            this.layout = new AnchorLayout();

            this.themeSpecific();

            showWelcomeScreen();

            //Ecoute les évenements de changements d'écrans
            addEventListener(NavigationEvent.CHANGE_SCREEN, onChangeScreen);
            addEventListener(NavigationEvent.DECONNECTION, onDeconnection);
            //addEventListener(starling.events.Event.FATAL_ERROR, onErrorOccured);

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
        /**
         * Sur déconnexion
         * @param event Evenement de navigation
         */
        private function onDeconnection():void {
            // Dispose l'écran courant et le menu
            _currentScreen.removeFromParent(true);
            _menu.removeFromParent(true);
            // Affiche l'écran de login
            showLoginScreen();
        }

        /**
         * Sur cangement d'écran.
         * @param event Evenement de navigation
         */
        private function onChangeScreen(event:NavigationEvent):void {

            switch (event.params.id) {
                    // Affichage de l'écran "Login"
                case LoginScreen.NAVKEY:
                    _loginScreen = new LoginScreen(_loginController);
                    swapScreen(_loginScreen, true);
                break;
                case WelcomeScreen.NAVKEY:
                    _welcomeScreen = new WelcomeScreen(_welcomeControler);
                    swapScreen(_welcomeScreen, true);
                break;
                case SpringScreen.NAVKEY:
                    _springScreen = new SpringScreen(_springControler);
                    swapScreen(_springScreen, true);
                break;
                /*case DiscussionsListScreen.NAVKEY:
                    _DiscussionsListScreen = new SpringScreen(_discussionsListControler);
                    swapScreen(_DiscussionsListScreen, true);
                    break;*/
            }
        }

        /**
         * Dispose l'écran actuellement affiché si le nouvel écran est différent
         * Cache l'écran courant si un autre écran doit être affiché ou qui l'action est forcée
         * @param screen Ecran a afficher
         * @param force Force le changement d'écran si true, par défaut false
         */
        private function swapScreen(screen:Screen, force:Boolean=false):void{

            if(_currentScreen == null){
                this.addChild(screen);
                _currentScreen = screen;

            }else if (_currentScreen != screen || force){
                _currentScreen.removeFromParent(true);
                this.addChild(screen);
                _currentScreen = screen;
            }
        }

        private function themeSpecific():void {
            // Stye du text callout
            TextCallout.calloutFactory = function():TextCallout {
                var callout:TextCallout = new TextCallout();
                callout.styleName = TextInput.DEFAULT_CHILD_STYLE_NAME_ERROR_CALLOUT;
                callout.closeOnTouchBeganOutside = true;
                callout.closeOnTouchEndedOutside = true;
                return callout;
            };
        }
    }
}
