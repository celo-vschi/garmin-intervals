using Toybox.WatchUi;
using Toybox.System;

class intervalsappMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :lats) {
            System.println(:lats.toString());
        } else if (item == :abs) {
            System.println(:abs.toString());
        }
    }

}