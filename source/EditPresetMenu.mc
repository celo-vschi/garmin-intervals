using Toybox.WatchUi;

class EditPresetMenu extends WatchUi.Menu {

	function initialize(title, id) {
		Menu.initialize();
		setTitle(title);

        var label = WatchUi.loadResource(Rez.Strings.ExercisesLabel);		
		addItem(label, :exercises);
		
		label = WatchUi.loadResource(Rez.Strings.WorkTimeLabel);
		addItem(label, :workTime);
		
		label = WatchUi.loadResource(Rez.Strings.RestTimeLabel);
		addItem(label, :restTime);
		
		label = WatchUi.loadResource(Rez.Strings.RemovePresetLabel);
		addItem(label, :remove);
	}

}