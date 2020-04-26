using Toybox.System;
using Toybox.WatchUi;

class intervalsappView extends WatchUi.View {

	const DRAWABLE_PRESET_NAME = "PresetName";
	
	private var PROP_WORK_TIME;
	private var PROP_REST_TIME;
	private var PROP_EXERCISES;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
    	var presetName = Properties.getPresetName();

    	// Set the preset name text
    	var drawable = View.findDrawableById(DRAWABLE_PRESET_NAME);
    	drawable.setText("#" + presetName.toLower());

    
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
    
    function startActivity() {
    	loadProperties();
    	WatchUi.requestUpdate();
    }
    
    function loadProperties() {
    	PROP_WORK_TIME = Properties.getWorkTime();
    	System.println("Work time: " + PROP_WORK_TIME);
    	
    	PROP_REST_TIME = Properties.getRestTime();
    	System.println("Rest time: " + PROP_REST_TIME);
    	
    	PROP_EXERCISES = Properties.getExercises();
    	System.println("Exercises: " + PROP_EXERCISES);
    	
    }

}
