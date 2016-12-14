/**
 * Created by julien.schneide on 14.12.2016.
 */
package ch.hegarc.ig.TP2016.presentation.screens {
import ch.hegarc.ig.TP2016.presentation.controllers.SpringController;

public class SpringScreen extends Screen{

    /** Contrôleur de la vue, raccourci pour ne pas caster à chaque utilisation */
    private var _controller:SpringController;
    /** Clé de navigation pour cet écran */
    public static const NAVKEY:String="spring";

    public function SpringScreen() {
        super(ViewType.DETAIL, controller);
        _controller = controller as SpringController;
    }

}
}
