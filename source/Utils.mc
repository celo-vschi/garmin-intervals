using Toybox.Lang;

module Utils {

	function formatTimerValue(seconds) {
		var timer;
		
		if (seconds < 10) {
			timer = "0" + seconds;
		} else {
			timer = seconds.toString();
		}
		
		return timer;
	}
	
	function formatExerciseLabel(exercise, max) {
		return Lang.format("$1$ / $2$", [exercise.format("%d"), max.format("%d")]);
	}
	
}