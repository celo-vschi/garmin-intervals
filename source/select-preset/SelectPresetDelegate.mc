using Toybox.WatchUi;
using Toybox.System;

class SelectPresetDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        switch (item) {
        	case :preset1:
	            Properties.setPresetNumber(1);
        		break;
        	case :preset2:
	            Properties.setPresetNumber(2);
        		break;
        	case :preset3:
	            Properties.setPresetNumber(3);
        		break;
 			case :preset4:
	            Properties.setPresetNumber(4);
        		break;
        	case :preset5:
	            Properties.setPresetNumber(5);
        		break;
        }
	}
	        
}