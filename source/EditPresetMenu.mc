using Toybox.WatchUi as Ui;
using Toybox.System;

class EditPresetMenu extends Ui.Menu {

	const EMPTY = "-";
	private var mId;

	function initialize(title, id) {
		Menu.initialize();
		mId = id;
		setTitle(title);

        var label = Ui.loadResource(Rez.Strings.ExercisesLabel);		
		addItem(label, :exercises);
		
		label = Ui.loadResource(Rez.Strings.WorkTimeLabel);
		addItem(label, :workTime);
		
		label = Ui.loadResource(Rez.Strings.RestTimeLabel);
		addItem(label, :restTime);
		
		if (!isLastPreset()) {
			label = Ui.loadResource(Rez.Strings.RemovePresetLabel);
			addItem(label, :remove);
		}
	}
	
	function isLastPreset() {
		var count = 0;
		for (var i=1; i<=5; i++) {
			var presetName = Properties.getPresetNameForPreset(i);
			if (!EMPTY.equals(presetName)) {
				count++;
			}
		}
		
		return count == 1;
	}	


}