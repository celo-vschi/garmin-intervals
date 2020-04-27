using Toybox.System;
using Toybox.WatchUi;
using Toybox.Timer;
using Toybox.Graphics;

class intervalsappView extends WatchUi.View {

	const DRAWABLE_PRESET = "PresetName";
	const DRAWABLE_INSTRUCTIONS = "InstructionsLabel";
	const DRAWABLE_TIMER = "TimerLabel";
	const DRAWABLE_EXERCISE = "ExerciseLabel";
	
	private var PROP_WORK_TIME;
	private var PROP_REST_TIME;
	private var PROP_EXERCISES;
	private var PREP = 3; // to be added to props
	
	private var RUNNING = false;
	private var RESTING = false;
	
	private var EXERCISES = 0;
	private var PERIOD_TIME = 0;
	
	private var TIMER;
	

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

    	// draw the preset name text
    	var drawable = View.findDrawableById(DRAWABLE_PRESET);
    	drawable.setText("#" + presetName.toLower());
    	
    	// draw the main text
    	drawable = View.findDrawableById(DRAWABLE_INSTRUCTIONS);
    	drawInstructions(drawable);
    	
    	// draw the timer
    	drawable = View.findDrawableById(DRAWABLE_TIMER);
    	drawTimer(drawable);
    	
    	// draw the exercise count
    	drawable = View.findDrawableById(DRAWABLE_EXERCISE);
    	drawExercise(drawable);

    
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
    
    function startActivity() {
    	// load props
    	loadProperties();
    	
    	// init vars
    	RUNNING = true;
    	RESTING = true;
    	EXERCISES = 0;
    	PERIOD_TIME = 0;
    	
    	// start timre
    	TIMER = new Timer.Timer();
    	TIMER.start(method(:timerAction), 1000, true);
    	
    	WatchUi.requestUpdate();
    }
    
    function timerAction() {
    	if (RUNNING) {
    		PERIOD_TIME++;
			
			if (RESTING) {
				var delay = EXERCISES < 1 ? PREP : PROP_REST_TIME;
				if (PERIOD_TIME >= delay) {
					switchToWorkout();
				}
			} else if (PERIOD_TIME >= PROP_WORK_TIME) {
				switchToRest();
			}
    	}
		WatchUi.requestUpdate();    	
    }
    
    function switchToWorkout() {
    	EXERCISES++;
    	PERIOD_TIME = 0;
    	RESTING = false;
    	
    	Notifications.notifyEnd();
    }
    
    function switchToRest() {
    	PERIOD_TIME = 0;
    	RESTING = true;
    	
    	Notifications.notifyEnd();
    	
    	// if is done .. bla bla
    }
    
    function drawInstructions(drawable) {
    	var text = "";
    	var color;

    	if (RUNNING) {
    		if (RESTING) {
    			if (EXERCISES < 1) {
    				text = WatchUi.loadResource(Rez.Strings.get_ready);
    				color = Graphics.COLOR_YELLOW;
    			} else {
    				text = WatchUi.loadResource(Rez.Strings.rest);
    				color = Graphics.COLOR_GREEN;
				} 
    		} else {
    			text = WatchUi.loadResource(Rez.Strings.work);
    			color = Graphics.COLOR_RED;
			}
    	} else {
    		text = WatchUi.loadResource(Rez.Strings.press_start);
    		color = Graphics.COLOR_WHITE;
    	}
    	
    	drawable.setText(text);
    	drawable.setColor(color);
    }
    
    function drawTimer(drawable) {
		var text;
	
		if (RUNNING) {
			var delay = EXERCISES < 1 ? PREP : PROP_REST_TIME;
			var seconds = (RESTING ? delay : PROP_WORK_TIME) - PERIOD_TIME;
			text = Utils.formatTimerValue(seconds);	
		} else {
			text = WatchUi.loadResource(Rez.Strings.no_value);
		}
		
		drawable.setText(text);	
    }
    
    function drawExercise(drawable) {
    	var text;
    	
    	if (RUNNING && EXERCISES > 0) {
    		text = Utils.formatExerciseLabel(EXERCISES, PROP_EXERCISES);
    	} else {
    		text = WatchUi.loadResource(Rez.Strings.no_value);
    	}
    	
    	drawable.setText(text);
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
