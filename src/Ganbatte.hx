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

		var s = new LessonState("");	
		var p = new PageCreator(s);	
		p.createComponents([{
			name: 'Button',
			attributes: [
				'x' => 20,
				'y' => 20,
				'scaleX' => 1,
				'scaleY' => 1
			],
			innerData: "Press me!",
			instance: null
		}]);

		var label = new Label();
		label.text = "Hello World";
		addChild(label);
	}
}