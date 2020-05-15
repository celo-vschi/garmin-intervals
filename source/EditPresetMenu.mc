using Toybox.WatchUi as Ui;
using Toybox.System;

class EditPresetMenu extends Ui.Menu {

	const EMPTY = "-";
	private var mId;

	function initialize(title, id) {
		Menu.initialize();
		mId = id;
		setTitle(title);
		
		var activated = Properties.isPresetActivated(mId);
		var label = activated ? "Activated" : "Deactivated";
		addItem(label, :activate);

        label = Ui.loadResource(Rez.Strings.ExercisesLabel);		
		addItem(label, :exercises);
		
		label = Ui.loadResource(Rez.Strings.WorkTimeLabel);
		addItem(label, :workTime);
		
		label = Ui.loadResource(Rez.Strings.RestTimeLabel);
		addItem(label, :restTime);
	}
	
}