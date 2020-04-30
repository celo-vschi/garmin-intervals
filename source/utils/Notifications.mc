using Toybox.Attention;

module Notifications {

	function notifyEnd() {
		Attention.vibrate([
			new Attention.VibeProfile(100, 1000)
		]);
	}
	
}