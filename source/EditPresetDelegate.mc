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
        	case :activate:
        		var label = Rez.Strings.ActivatedLabel;
        		var activated = Properties.isPresetActivated(mId);
        		var title = activated ? "Deactivate?" : "Activate?";
        		var dialog = new Ui.Confirmation(title);
        		Ui.pushView(
        			dialog,
        			new ActivatePresetConfirmationDelegate(mId, activated),
        			Ui.SLIDE_IMMEDIATE
        		);
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
        }
        return true;
	}
		        
}