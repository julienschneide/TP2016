/**
 * Created by Julien on 12.10.2016.
 */
package ch.hegarc.ig.TP2016.presentation {

    import feathers.controls.Button;
    import feathers.controls.TextCallout;
    import feathers.themes.MetalWorksMobileTheme;

    import starling.display.Sprite;
    import starling.text.TextField;

    public class Welcome extends Sprite{

        private var _btnConnect:Button;

        public function Welcome() {

            var textfield:TextField = new TextField(400,200, "Welcome §111111111!");
            addChild(textfield);

            _btnConnect = new Button();
            _btnConnect.label = "Se connecter";
            addChild(_btnConnect);
        }

    }
}
