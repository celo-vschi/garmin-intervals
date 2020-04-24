using Toybox.WatchUi;

class intervalsappDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new intervalsappMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}