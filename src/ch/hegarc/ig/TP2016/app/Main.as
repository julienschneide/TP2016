package ch.hegarc.ig.TP2016.app {

    import feathers.controls.Button;
    import feathers.controls.TextCallout;
    import feathers.themes.MetalWorksMobileTheme;

    import starling.display.Sprite;
    import starling.text.TextField;

    public class Main extends Sprite {

        private var _btnConnect:Button;

        public function Main() {

            var textfield:TextField = new TextField(400,200, "Welcome !");
            addChild(textfield);

            _btnConnect = new Button();
            _btnConnect.label = "Se connecter";
            addChild(_btnConnect);

        }
    }
}
