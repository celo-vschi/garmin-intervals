using Toybox.Application;
using Toybox.WatchUi;

class IntervalsApp extends Application.AppBase {

	private var view;

    function initialize() {
        AppBase.initialize();
    }

    function getInitialView() {
    	view = new IntervalsView();
    	view.loadProperties();
    	
    	var delegate = new IntervalsDelegate();
    	delegate.setView(view);
    	
        return [ view, delegate ];
    }
    
    function onSettingsChanged() {
		view.loadProperties();
		WatchUi.requestUpdate();
	}
}
