/**
 * Created by julien.schneide on 14.12.2016.
 */
package ch.hegarc.ig.TP2016.presentation.screens {
import ch.hegarc.ig.TP2016.presentation.controllers.SpringController;
import ch.hegarc.ig.TP2016.presentation.events.NavigationEvent;

import feathers.controls.Button;
import feathers.controls.Label;
import feathers.controls.LayoutGroup;

import feathers.controls.TextInput;
import feathers.layout.VerticalLayout;

import starling.events.Event;

public class SpringScreen extends Screen{

    //Bouton fonction upper
    private var _tiToUpper:TextInput;
    private var _btnUpper:Button;
    private var _UpperLabel:Label;

    //Bouton de retour à l'écran d'accueil
    private var _btnWelcome:Button;

    /** Contrôleur de la vue, raccourci pour ne pas caster à chaque utilisation */
    private var _controller:SpringController;
    /** Clé de navigation pour cet écran */
    public static const NAVKEY:String="spring";

    public function SpringScreen(controller:SpringController) {
        super(ViewType.DETAIL, controller);
        _controller = controller as SpringController;
    }

    override protected function initialize():void{
        super.initialize();
        super.title = "Ecran des services Spring";

        var group:LayoutGroup = new LayoutGroup();
        this.addChild( group );
        var layout:VerticalLayout = new VerticalLayout();
        layout.gap = 10;
        layout.paddingTop = 25;
        group.layout = layout;

        _tiToUpper = new TextInput();
        _tiToUpper.text = "miniscule";
        _UpperLabel = new Label();
        _btnUpper = new Button();
        _btnUpper.label = "To UpperCase";
        _btnUpper.addEventListener(Event.TRIGGERED, toUpper);
        group.addChild(_tiToUpper);
        group.addChild(_UpperLabel);
        group.addChild(_btnUpper);

        _btnWelcome = new Button();
        _btnWelcome.label = "Retour à l'accueil";
        _btnWelcome.addEventListener(Event.TRIGGERED, goToWelcome);
        group.addChild(_btnWelcome);
    }

    private function toUpper(event:Event):void{
        var uppered:String;
        _controller.toUpper(_tiToUpper.text);
        //_UpperLabel.text = uppered
    }

    private function goToWelcome(event:Event):void{
        var navEvent:NavigationEvent = new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: WelcomeScreen.NAVKEY}, true);
        dispatchEvent(navEvent);
    }
}
}
