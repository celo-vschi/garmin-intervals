using Toybox.WatchUi;
using Toybox.System;

class EditPresetDelegate extends WatchUi.MenuInputDelegate {

	private var mId;

    function initialize(id) {
        MenuInputDelegate.initialize();
        mId = id;
    }

    function onMenuItem(item) {
        switch (item) {
        	case :exercises:
        		var label = Rez.Strings.ExercisesLabel;
				var value = Properties.getExercisesForPreset(mId);
				var delegate = new NumberPickerDelegate(:exercises, mId);
				WatchUi.pushView(new NumberPicker(label, value, 1, 99), delegate, WatchUi.SLIDE_IMMEDIATE);
        		break;
        	case :workTime:
        		label = Rez.Strings.WorkTimeLabel;
        		value = Properties.getWorkTimeForPreset(mId);
        		delegate = new NumberPickerDelegate(:workTime, mId);
        		WatchUi.pushView(new NumberPicker(label, value, 1, 99), delegate, WatchUi.SLIDE_IMMEDIATE);
        		break;
        	case :restTime:
        		label = Rez.Strings.RestTimeLabel;
        		value = Properties.getRestTimeForPreset(mId);
        		delegate = new NumberPickerDelegate(:restTime, mId);
        		WatchUi.pushView(new NumberPicker(label, value, 1, 99), delegate, WatchUi.SLIDE_IMMEDIATE);
        		break;
 			case :remove:
        		System.println("remove");
        		
				var message = "Continue?";
				var dialog = new WatchUi.Confirmation(message);
				WatchUi.pushView(
				    dialog,
				    new ConfirmationDelegate(),
				    WatchUi.SLIDE_IMMEDIATE
);        		
        		
        		break;
        }
        return true;
	}
	        
}