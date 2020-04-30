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
        		System.println(label);
				/*
				var value = Properties.getExercisesForPreset(mId);
				var delegate = new NumberPickerDelegate(:exercises, mId);
				WatchUi.pushView(new NumberPicker(label, value, 1, 99), delegate, WatchUi.SLIDE_IMMEDIATE);
				*/
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
 			case :delete:
        		System.println("delete");
        		break;
        }
        return true;
//		WatchUi.pushView(new EditPresetMenu(title, id), null, WatchUi.SLIDE_UP);
	}
	        
}