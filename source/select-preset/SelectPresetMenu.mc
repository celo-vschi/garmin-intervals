using Toybox.WatchUi as Ui;
using Toybox.System;

class SelectPresetMenu extends Ui.Menu {

	const EMPTY = "-";
	
	function initialize(edit) {
		Menu.initialize();
		setTitle("Presets");
		
		for (var i=1; i<=5; i++) {
			var presetName = Properties.getPresetNameById(i);
			if (!EMPTY.equals(presetName)) {
				addItem(presetName, i);
			}
		}
		
		if (edit) {
			addItem("Add New", :addNew);
		}
		
	}
	
	

}