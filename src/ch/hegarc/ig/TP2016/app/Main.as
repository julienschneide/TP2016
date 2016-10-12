package ch.hegarc.ig.TP2016.app {

    import ch.hegarc.ig.TP2016.presentation.Welcome;

    import flash.display.Sprite;

    import starling.core.Starling;

    [SWF(width="1920", height="1080", frameRate="60", backgroundColor="#fff444")]
    public class Main extends Sprite {

        private var _starling:Starling;

        public function Main() {
            _starling = new Starling(Welcome, stage);
            _starling.start();
        }
    }
}
