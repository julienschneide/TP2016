/**
 * Created by Julien on 12.10.2016.
 */
package ch.hegarc.ig.TP2016.presentation.screens {

import ch.hegarc.ig.TP2016.presentation.controllers.WelcomeController;

import feathers.controls.Button;
import feathers.controls.Label;
import feathers.controls.TextCallout;
    import feathers.themes.MetalWorksMobileTheme;

    import starling.display.Sprite;
    import starling.text.TextField;


    public class WelcomeScreen extends Screen{

        private var _welcomeLabel:Label;
        private var _controller:WelcomeController;

        public function WelcomeScreen(controller:WelcomeController) {
            super(ViewType.DETAIL, controller);
            _controller = controller as WelcomeController;
        }

        override protected function initialize():void{
            super.initialize();
            _welcomeLabel = new Label();
            _welcomeLabel.text = "Bienvenue dans l'application TP2016";
            addChild(_welcomeLabel);
        }

    }
}
