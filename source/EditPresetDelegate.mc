using Toybox.WatchUi as Ui;
using Toybox.System;

class EditPresetDelegate extends Ui.MenuInputDelegate {

	private var mId;

    function initialize(id) {
        MenuInputDelegate.initialize();
        mId = id;
    }

    function onMenuItem(item) {
        switch (item) {
        	case :activated:
        		var label = Rez.Strings.ActivatedLabel;
        		var value = Properties.isPresetActivated(mId);
        		System.println(value);
        		break;
        	case :exercises:
        		label = Rez.Strings.ExercisesLabel;
				value = Properties.getExercisesForPreset(mId);
				var delegate = new NumberPickerDelegate(:exercises, mId);
				Ui.pushView(new NumberPicker(label, value, 1, 99), delegate, Ui.SLIDE_IMMEDIATE);
        		break;
        	case :workTime:
        		label = Rez.Strings.WorkTimeLabel;
        		value = Properties.getWorkTimeForPreset(mId);
        		delegate = new NumberPickerDelegate(:workTime, mId);
        		Ui.pushView(new NumberPicker(label, value, 1, 99), delegate, Ui.SLIDE_IMMEDIATE);
        		break;
        	case :restTime:
        		label = Rez.Strings.RestTimeLabel;
        		value = Properties.getRestTimeForPreset(mId);
        		delegate = new NumberPickerDelegate(:restTime, mId);
        		Ui.pushView(new NumberPicker(label, value, 1, 99), delegate, Ui.SLIDE_IMMEDIATE);
        		break;
 			case :remove:
				var dialog = new Ui.Confirmation("Remove?");
				Ui.pushView(
					dialog,
				    new DeletePresetConfirmationDelegate(mId),
				    Ui.SLIDE_IMMEDIATE
				);
				
        		break;
        }
        return true;
	}
	        
}