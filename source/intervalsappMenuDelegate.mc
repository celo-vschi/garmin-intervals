using Toybox.WatchUi;
using Toybox.System;

class intervalsappMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :preset_1) {
            Properties.setPresetNumber(1);
        } else if (item == :preset_2) {
            Properties.setPresetNumber(2);
        }
    }

}