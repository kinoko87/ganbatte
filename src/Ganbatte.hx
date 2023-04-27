import sys.FileSystem;
import engine.PageCreator;
import states.LessonState;
import engine.State;
import engine.XmlParser;
import feathers.controls.Application;
import feathers.controls.Label;

class Ganbatte extends Application {
	public function new() {
		super();

		#if debug
		trace("Debug mode");
		#end

		stage.window.onClose.add(onClose);

		var label = new Label();
		label.text = "Hello World";
		addChild(label);
	}

	function onClose() {
		for (f in FileSystem.readDirectory("assets/cache")) {
			if (FileSystem.isDirectory("assets/cache/"+f))
				FileSystem.deleteDirectory("assets/cache/"+f);
			else
				FileSystem.deleteFile("assets/cache/"+f);
		}
	}
}