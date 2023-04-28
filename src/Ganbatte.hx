import openfl.events.Event;
import openfl.events.EventType;
import states.TestState;
import sys.FileSystem;
import engine.PageCreator;
import states.LessonState;
import engine.State;
import engine.XmlParser;
import feathers.controls.Application;
import feathers.controls.Label;

class Ganbatte extends Application {
	
	public static var state:State;
	
	public function new() {
		super();

		#if debug
		trace("Debug mode");
		#end

		stage.window.onClose.add(onClose);

		Ganbatte.state = new TestState();

		onOpenState();

		this.addEventListener(Event.ENTER_FRAME, (e) -> {
			if (Ganbatte.state != null) {
				Ganbatte.state.update(1/this.stage.frameRate);
			}			
		});

		stage.window.onEnter.add(()->{trace(1);});

		var label = new Label();
		label.text = "Hello World";
		addChild(label);
	}

	function onOpenState() {
		Ganbatte.state.create();
	}

	function onClose() {
		for (f in FileSystem.readDirectory("cache")) {
			if (FileSystem.isDirectory("cache/"+f))
				FileSystem.deleteDirectory("cache/"+f);
			else
				FileSystem.deleteFile("cache/"+f);
		}
	}
}