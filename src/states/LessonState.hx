package states;
import engine.State;

// TODO: Save lesson state
class LessonState extends State {

    /**
     * Repeats is the number of excercises that
     * the user had failed/has selected to repeat.
     * Once repeats are at 0, the lesson is finished.
     */
    public var repeats:Int = 0;

    public var lessonPath:String;

    public function new(lessonPath:String) {
        super("lesson");
        this.lessonPath = lessonPath;
    }

    public function create() {

    }

    public function update(deltaTime:Float) {
        
    }
}