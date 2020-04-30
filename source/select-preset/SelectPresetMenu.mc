using Toybox.WatchUi as Ui;
using Toybox.System;

class SelectPresetMenu extends Ui.Menu {

	const EMPTY = "-";
	
	function initialize(edit) {
		Menu.initialize();
		setTitle("Presets");
		
		var presetName = null; 
		var label = null;
		for (var i=1; i<=5; i++) {
			switch(i) {
				case 1: 
					presetName = Ui.loadResource(Rez.Strings.preset1);
					label = :preset1;
					break;
				case 2:
					presetName = Ui.loadResource(Rez.Strings.preset2);
					label = :preset2;
					break;
				case 3: 
					presetName = Ui.loadResource(Rez.Strings.preset3);
					label = :preset3;
					break;
				case 4:
					presetName = Ui.loadResource(Rez.Strings.preset4);
					label = :preset4;
					break;
				case 5: 
					presetName = Ui.loadResource(Rez.Strings.preset5);
					label = :preset5;
					break;
			}
			
			if (!EMPTY.equals(presetName)) {
				addItem(presetName, label);
			}
		}
		
		if (edit) {
			addItem("Add New", :addNew);
		}
		
	}
	
	

}