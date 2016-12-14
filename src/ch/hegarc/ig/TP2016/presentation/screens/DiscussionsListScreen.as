/**
 * Created by julien.schneide on 13.12.2016.
 */
package ch.hegarc.ig.TP2016.presentation.screens {
import ch.hegarc.ig.TP2016.presentation.controllers.DiscussionsListController;

public class DiscussionsListScreen extends Screen{

    /** Contrôleur de la vue, raccourci pour ne pas caster à chaque utilisation */
    private var _controller:DiscussionsListController;

    /** Clé de navigation pour cet écran */
    public static const NAVKEY:String="discussionsList";

    public function DiscussionsListScreen() {
        super(ViewType.DETAIL, controller);
        _controller = controller as DiscussionsListController;
    }

}
}
