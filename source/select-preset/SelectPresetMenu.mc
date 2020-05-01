using Toybox.WatchUi as Ui;
using Toybox.System;

class SelectPresetMenu extends Ui.Menu {

	const EMPTY = "-";
	
	function initialize(edit) {
		Menu.initialize();
		setTitle("Presets");
		
		var presets = 0;
		for (var i=1; i<=5; i++) {
			var presetName = Properties.getPresetNameForPreset(i);
			if (!EMPTY.equals(presetName)) {
				addItem(presetName, i);
				presets++;
			}
		}
		
		if (edit && presets < 5) {
			addItem("Add New", :addNew);
		}
		
	}
	
	

}