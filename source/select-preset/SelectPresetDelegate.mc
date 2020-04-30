using Toybox.WatchUi;
using Toybox.System;

class SelectPresetDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
    	Properties.setPresetNumber(item);
	}
	        
}