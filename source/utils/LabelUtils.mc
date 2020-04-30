using Toybox.System;
using Toybox.Graphics;
using Toybox.WatchUi;

module LabelUtils {

	function getExerciseLabel(running, exercises, propExercises) {
		var text;
		
		if (running && exercises > 0) {
    		text = Utils.formatExerciseLabel(exercises, propExercises);
    	} else {
    		text = WatchUi.loadResource(Rez.Strings.no_value);
    	}
    	
    	return text;
	}

	function getTimerLabel(running, resting, exercises, periodTime, propPrepTime, propRestTime, propWorkTime) {
		var text;
		
		if (running) {
			var delay = exercises < 1 ? propPrepTime : propRestTime;
			var seconds = (resting ? delay : propWorkTime) - periodTime;
			text = Utils.formatTimerLabel(seconds);	
		} else {
			text = WatchUi.loadResource(Rez.Strings.no_value);
		}
		
		return text;
	} 
	
	function getInstructionsLabel(running, resting, exercises, paused) {
		var text;
		var color;
		
		if (running) {
    		if (resting) {
    			if (exercises < 1) {
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
			
			if (paused) {
				text = WatchUi.loadResource(Rez.Strings.paused);
				color = Graphics.COLOR_YELLOW;
			}
			
    	} else {
    		text = WatchUi.loadResource(Rez.Strings.press_start);
    		color = Graphics.COLOR_WHITE;
    	}
		
		return {
			:text => text, 
			:color => color
		};
	}

}