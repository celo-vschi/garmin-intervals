using Toybox.WatchUi as Ui;
using Toybox.System;

class SelectPresetMenu extends Ui.Menu {

	function initialize(edit) {
		Menu.initialize();
		setTitle("Presets");
		
		// if !edit mode add only activated presets to the list 
		var presetName;
		var presets = 0;
		for (var i=1; i<=5; i++) {
			presetName = Properties.getPresetNameForPreset(i);
			if (!edit) {
				var activated = Properties.isPresetActivated(i);
				if (!activated) {
					continue;
				} else {
					presets++;
				}				
			}
		    addItem(presetName, i);
		}
		
		// if there are no presets and !edit show a message
	    if (presets == 0 && !edit) {
	    	addItem("No presets are activated", :none);
	    }		
	}
	
}