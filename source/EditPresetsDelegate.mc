using Toybox.WatchUi;
using Toybox.System;

class EditPresetsDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        var title = null;
        var id = 0;
        switch (item) {
        	case :preset1:
        		title = WatchUi.loadResource(Rez.Strings.preset1);
        		id = 1;
        		break;
        	case :preset2:
	            title = WatchUi.loadResource(Rez.Strings.preset2);
        		id = 2;
        		break;
        	case :preset3:
	            title = WatchUi.loadResource(Rez.Strings.preset3);
        		id = 3;
        		break;
 			case :preset4:
	 			title = WatchUi.loadResource(Rez.Strings.preset4);
        		id = 4;
        		break;
        	case :preset5:
        		title = WatchUi.loadResource(Rez.Strings.preset5);
        		id = 5;
        		break;
        }
		WatchUi.pushView(new EditPresetMenu(title, id), new EditPresetDelegate(id), WatchUi.SLIDE_UP);
	}
	        
}