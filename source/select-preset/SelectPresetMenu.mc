using Toybox.WatchUi;
using Toybox.System;

class SelectPresetMenu extends WatchUi.Menu {

	const EMPTY = "-";
	
	function initialize() {
		Menu.initialize();
		setTitle("Select Preset");
		
		var presetName = null; 
		var label = null;
		for (var i=1; i<=8; i++) {
			switch(i) {
				case 1: 
					presetName = WatchUi.loadResource(Rez.Strings.preset1);
					label = :preset1;
					break;
				case 2:
					presetName = WatchUi.loadResource(Rez.Strings.preset2);
					label = :preset2;
					break;
				case 3: 
					presetName = WatchUi.loadResource(Rez.Strings.preset3);
					label = :preset3;
					break;
				case 4:
					presetName = WatchUi.loadResource(Rez.Strings.preset4);
					label = :preset4;
					break;
				case 5: 
					presetName = WatchUi.loadResource(Rez.Strings.preset5);
					label = :preset5;
					break;
				case 6: 
					presetName = WatchUi.loadResource(Rez.Strings.preset6);
					label = :preset6;
					break;
				case 7: 
					presetName = WatchUi.loadResource(Rez.Strings.preset7);
					label = :preset7;
					break;
				case 8: 
					presetName = WatchUi.loadResource(Rez.Strings.preset8);
					label = :preset8;
					break;
				default: presetName = null;
					break;
			}
			
			if (!EMPTY.equals(presetName)) {
				addItem(presetName, label);
			}
		}
	}

}