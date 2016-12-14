/**
 * Created by Julien on 12.10.2016.
 */
package ch.hegarc.ig.TP2016.presentation.screens {

    import feathers.controls.Label;
    import feathers.controls.LayoutGroup;
    import feathers.layout.AnchorLayout;
    import feathers.layout.AnchorLayoutData;

    /**
     * Ecran de l'application.
     * Un écran peut être le même pour l'ajout ou l'édition.
     * Un écran respecte le pattern MVC.
     */
    public class Screen extends LayoutGroup{

        /** Titre de l'écran */
        private var _title:Label;
        /** Type d'écran */
        private var _type:int;
        /** Controller de l'écran */
        private var _controller:Object;

        /** Ancre centrée */
        private var _topCentered:AnchorLayoutData;
        /** Ancre depuis la gauche */
        private var _leftAnchor:AnchorLayoutData;
        /** Longueur de la région par défaut */
        private static const DEFAULT_LEFT_PADDING:int = 50;

        /** Action d'édition */
        public static const ACTION_EDIT:int = 0;
        public static const ACTION_MANAGE:int = 1;
        public static const ACTION_DELETE:int = 2;
        public static const ACTION_ADD:int = 3;

        public function Screen(type:int, controller:Object) {
            _type = type;
            _controller = controller;
        }

        override protected function initialize():void {
            // Positionne l'écran
            this.layoutData = new AnchorLayoutData(0, 0, 0, 0);

            this.width = stage.stageHeight - 200;
            this.height = stage.stageHeight;

            // Permet la gestion des ancres
            this.layout = new AnchorLayout();

            _leftAnchor = new AnchorLayoutData();
            _leftAnchor.left = DEFAULT_LEFT_PADDING;

            _topCentered = new AnchorLayoutData();
            _topCentered.horizontalCenter = 0;
            _topCentered.top = 75;

            // Ancre en haut à droite
            var topLeftAnchor:AnchorLayoutData = new AnchorLayoutData();
            topLeftAnchor.top = 5;
            topLeftAnchor.left = 5;

            // Titre de l'écran
            _title = new Label();
            _title.styleNameList.add( Label.ALTERNATE_STYLE_NAME_HEADING );
            _title.layoutData = topLeftAnchor; // Ancré en haut à droite
            this.addChild(_title);
        }

        /**
         * Méthode effectuant le traitement sur l'affichage selon le type d'écran
         */
        public function typeSpecific():void {
        }

        // TODO Add Region comme ca le dispose agira sur toutes les régions !
        // TODO
        /*override public function dispose():void{
         this.removeFromParent(true);
         }*/

        public function set title(value:String):void {
            _title.text = value;
        }

        public function get type():int {
            return _type;
        }

        public function set type(value:int):void {
            _type = value;
        }

        public function get controller():Object {
            return _controller;
        }

        public function set controller(value:Object):void {
            _controller = value;
        }

        public function get leftAnchor():AnchorLayoutData {
            return _leftAnchor;
        }

        public function get topCentered():AnchorLayoutData {
            return _topCentered;
        }

    }
}
