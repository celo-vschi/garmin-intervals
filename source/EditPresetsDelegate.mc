using Toybox.WatchUi as Ui;
using Toybox.System;

class EditPresetsDelegate extends Ui.MenuInputDelegate {

	const EMPTY = "-";

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        var title = null;
        var id = 0;
        switch (item) {
        	case :preset1:
        		id = 1;
        		title = Ui.loadResource(Rez.Strings.preset1);
        		break;
        	case :preset2:
        		id = 2;
	            title = Ui.loadResource(Rez.Strings.preset2);
        		break;
        	case :preset3:
        		id = 3;
	            title = Ui.loadResource(Rez.Strings.preset3);
        		break;
 			case :preset4:
        		id = 4;
	 			title = Ui.loadResource(Rez.Strings.preset4);
        		break;
        	case :preset5:
        		id = 5;
        		title = Ui.loadResource(Rez.Strings.preset5);
        		break;
        	case :addNew:
        		id = findFirstNotAddedPreset();
        		title = "Preset#" + id; 
        		
        		System.println(id + " " + title);
        		break;
        }
//		Ui.pushView(new EditPresetMenu(title, id), new EditPresetDelegate(id), Ui.SLIDE_UP);
	}
	
	function findFirstNotAddedPreset() {
		for (var i=1; i<=5; i++) {
			var presetName;
			switch (i) {
				case 1: 
					presetName = Ui.loadResource(Rez.Strings.preset1);
					break;
				case 2: 
					presetName = Ui.loadResource(Rez.Strings.preset2);
					break;
				case 3: 
					presetName = Ui.loadResource(Rez.Strings.preset3);
					break;
				case 4:
					presetName = Ui.loadResource(Rez.Strings.preset4);
					break;
				case 5:
					presetName = Ui.loadResource(Rez.Strings.preset5);
					break;
			}
			if (EMPTY.equals(presetName)) {
				return i;
			}
		}
		return 0;
	}
	        
}