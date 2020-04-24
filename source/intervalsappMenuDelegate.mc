using Toybox.WatchUi;
using Toybox.System;

class intervalsappMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :item_1) {
            System.println(:item_1.toString());
        } else if (item == :item_2) {
            System.println(:item_2.toString());
        }
    }

}