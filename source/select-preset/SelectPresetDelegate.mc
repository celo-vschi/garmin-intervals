using Toybox.WatchUi;
using Toybox.System;

class SelectPresetDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
    	if (item != :none) {
	    	Properties.setPreset(item);
    	}
	}
	        
}