using Toybox.System;
using Toybox.WatchUi;
using Toybox.Timer;
using Toybox.Graphics;
using Toybox.Attention;

class IntervalsView extends WatchUi.View {

	// Drawable ids
	const DRAWABLE_PRESET = "PresetName";
	const DRAWABLE_INSTRUCTIONS = "InstructionsLabel";
	const DRAWABLE_TIMER = "TimerLabel";
	const DRAWABLE_EXERCISE = "ExerciseLabel";
	
	// Properties
	private var prop_workTime;
	private var prop_restTime;
	private var prop_exercises;
	private var prop_prepTime;
	
	private var mRunning = false;
	private var mResting = false;
	private var mPaused = false;

	private var mExercises = 0;
	private var mPeriodTime = 0;
	private var mTimer;
	
	private var mVibrations;

    function initialize() {
        View.initialize();
        mVibrations = new Vibrations();
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
    	var presetName = Properties.getCurrentPresetName();

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
    	mRunning = true;
    	mResting = true;
    	mExercises = 0;
    	mPeriodTime = 0;
    	
    	// start timer
    	mTimer = new Timer.Timer();
    	mTimer.start(method(:timerAction), 1000, true);
    	
    	WatchUi.requestUpdate();
    }
    
    function stopActivity() {
    	mTimer.stop();
    	mVibrations.finish();
		closeActivity(); 	
    }
    
    function pauseActivity() {
    	mVibrations.pause();
    	mPaused = true;
    	mTimer.stop();

		WatchUi.requestUpdate();
    }
    
    function resumeActivity() {
    	mVibrations.pause();
    	mPaused = false;
    	mTimer.start(method(:timerAction), 1000, true);
    	
    	WatchUi.requestUpdate();
    }
    
    function closeActivity() {
    	mRunning = false;
    	mResting = false;
    	mExercises = 0;
    	mPeriodTime = 0;
    	
    	WatchUi.requestUpdate();
    }
    
    function timerAction() {
    	if (mRunning) {
    		mPeriodTime++;
			
			if (mResting) {
				var delay = mExercises < 1 ? prop_prepTime : prop_restTime;
				if (mPeriodTime >= delay) {
					switchToWorkout();
				}
			} else if (mPeriodTime >= prop_workTime) {
				switchToRest();
			}
    	}
		WatchUi.requestUpdate();
    }
    
    function switchToWorkout() {
    	mExercises++;
    	mPeriodTime = 0;
    	mResting = false;
    	
    	mVibrations.work();
    }
    
    function switchToRest() {
    	mPeriodTime = 0;
    	mResting = true;
    	
		if (isFinished()) {
			stopActivity();
		} else {
			mVibrations.rest();
		}
    }
    
    function drawInstructions(drawable) {
    	var values = LabelUtils.getInstructionsLabel(mRunning, mResting, mExercises, mPaused);
    	drawable.setText(values.get(:text));
    	drawable.setColor(values.get(:color));
    }
    
    function drawTimer(drawable) {
		var text = LabelUtils.getTimerLabel(mRunning, mResting, mExercises, mPeriodTime,
			prop_prepTime, prop_restTime, prop_workTime);
		drawable.setText(text);	
    }
    
    function drawExercise(drawable) {
    	var text = LabelUtils.getExerciseLabel(mRunning, mExercises, prop_exercises);
    	drawable.setText(text);
    }
    
    function isRunning() {
    	return mRunning;
	}
	
	function isWorking() {
		return mRunning && !mResting;
	}
	
	function isResting() {
		return mRunning && mResting;
	}
	
	function isFinished() {
		return !mRunning || mExercises >= prop_exercises;
	}
	
	function isPaused() {
		return mRunning && mPaused;
	}
    
    function loadProperties() {
    	prop_prepTime = Properties.getCurrentPrepTime();
    	prop_exercises = Properties.getCurrentExercises();
    	prop_workTime = Properties.getCurrentWorkTime();
    	prop_restTime = Properties.getCurrentRestTime();
    }

}
