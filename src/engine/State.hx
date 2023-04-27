package engine;

import feathers.controls.Application;
import openfl.display.DisplayObject;

abstract class State {
    public static var currentState:State;
    public var id:String;
    public var children:Array<DisplayObject>;
    
    public function new(id:String) {
        this.id = id;
    }

    abstract public function create():Void;

    abstract public function update(deltaTime:Float):Void;

    public function add(child:DisplayObject) {
        children.push(child);
        Application.topLevelApplication.addChild(child);
    }

    public function remove(child:DisplayObject) {
        children.remove(child);
        Application.topLevelApplication.removeChild(child);
    }

    public function forEach(f:(DisplayObject->Void)) {
        for (c in children)
            f(c);
    }

    public function free() {
        for (c in children) {
            children.remove(c);
            c = null;
        }
    }
}